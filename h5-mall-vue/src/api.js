import axios from 'axios';
import localStore from 'store2';
import cookieStore from 'js-cookie';
import {
    Toast, Dialog
} from 'vant';
import config from './config';
import utils from './utils';
import store from './store';
import router from './router';
import wx from 'weixin-js-sdk';

function SupportStorage(){
    var testKey = 'test',
    storage = window.localStorage;
    try {
        storage.setItem(testKey, 'testValue');
        storage.removeItem(testKey);
        return true;
    } catch (error) {
        console.log(error)
        return false;
    }
}
const supportStorage = SupportStorage()

const cookie = {
    has(name) {
        let val = cookieStore.get(name);
        return val != undefined && val != null;
    },
    get(name) {
        let val = cookieStore.get(name);
        if(val && typeof val == 'string' && 
            (val.indexOf('[') === 0 || val.indexOf('{') === 0)){
            try{
                let json = JSON.parse(val)
                if(json)return json;
            }catch(err){
                console.log(err)
            }
        }
        return val;
    },
    set(name, data) {
        cookieStore.set(name, data)
    },
    remove(name) {
        cookieStore.remove(name)
    },
    clear() {

    }
}

function Api() {

    this.store = supportStorage?localStore:cookie;

    this.token = ''
    this.refreshToken = ''
    this.tokenTime = 0
    this.tokenExpire = 0

    this.store_key = 'token'

    this.isRefreshing = false;
    this.refreshEnd = [];

    this.is_authing = false
    this.wechatAuthed = false
    this.openid = ''
    this.accessToken = ''

    this.shareSeted = false
    this.shareData = {}
    this.blocked = false
}

Api.prototype.hasToken = function () {
    return this.token != '' && !this.isRefreshing;
}
Api.prototype.getToken = function () {
    return this.isRefreshing ? '' : this.token;
}

Api.prototype.hasAccessToken = function () {
    return this.accessToken != ''
}
Api.prototype.getAccessToken = function () {
    return this.accessToken
}
Api.prototype.checkAccessToken = function (force = false) {
    return new Promise((resolve, reject) => {
        if (!force && this.accessToken) {
            resolve(this.accessToken);
        } else {
            this
                .get("auth/token?appid=" + config.appid)
                .then(result => {
                    if (result.code == 1) {
                        this.accessToken = result.data;

                        resolve(this.accessToken);
                    }
                })
                .catch(err => {
                    reject(err);
                });
        }
    });
}

// 检测登录状态
Api.prototype.checkToken = function () {
    return new Promise((resolve, reject) => {
        if (this.token != '') {
            if (this.isRefreshing || this.tokenExpire + this.tokenTime < new Date().getTime() / 1000 - 10) {
                console.log('刷新token')
                this.refresh().then(() => {
                    resolve(this)
                }).catch(error => {
                    reject(error)
                })
            } else {
                resolve(this)
            }
        } else {
            reject({
                code: 0,
                msg: '未登录'
            })
        }
    })
}

// 从缓存恢复登录信息
Api.prototype.restore = function () {
    return new Promise((resolve) => {
        if (this.store.has(this.store_key)) {
            let info = this.store.get(this.store_key)
            //console.log('cache:',info)
            if (info.token && info.refresh_token) {
                console.log('从缓存恢复token')
                this.token = info.token
                this.refreshToken = info.refresh_token
                this.tokenTime = info.token_time
                this.tokenExpire = info.token_expire

                this.checkToken().then(() => {
                    store.commit('setIsLogin', true)
                    console.log('刷新token后授权')
                    this.checkWechat().then(() => {
                        resolve()
                    })
                }).catch(() => {
                    console.log('刷新token失败')
                    this.checkWechat(true).then(() => {
                        resolve()
                    })
                })
                return;
            }
        }
        console.log('未登录时授权')
        this.checkWechat(true).then(() => {
            resolve()
        })
    })
}

Api.prototype.checkWechat = function (login = false) {
    return new Promise((resolve) => {
        let iserror = this.store.get('wechat_error')
        if (iserror) {
            store.commit('setWechatChecked', true)
            console.log('授权已出错')
            resolve()
            return;
        }
        if (this.is_authing) {
            console.log('已发起授权')
            return;
        }
        if (!config.wxid) {
            store.commit('setWechatChecked', true)
            console.log('未配置微信号')
            resolve()
            return;
        }
        if (config.isWechat && (!this.openid || login)) {
            if (!login || this.wechatAuthed) {
                let openid = this.store.get('openid');
                if (openid) {
                    this.openid = openid;
                    console.log('从缓存中恢复openid')
                    store.commit('setWechatChecked', true)
                    resolve()
                    return;
                }
                if(this.wechatAuthed){
                    console.log('授权信息未正确获取')
                    store.commit('setWechatChecked', true)
                    resolve()
                    return;
                }
            }
            
            this.is_authing = true;
            this.blocked = true;
            let param = utils.parseQuery(location.search)
            if (param.code) {
                this.post('auth/wxlogin?code=' + param.code, {
                    wxid: config.wxid,
                    code: param.code
                }, true).then(json => {
                    if (json.code == 1) {
                        let unbinded = 1
                        if (!this.isLogin && json.data.token) {
                            this.setLogin(json.data)
                            unbinded = 0
                        }
                        this.setOpenid(json.data.openid, unbinded)
                    }
                }).catch(err => {
                    if (err.data && err.data.openid) {
                        this.setOpenid(err.data.openid)
                    }else{
                        this.wechatAuthError()
                    }
                })
            } else {
                this.post('auth/wxauth', {
                    wxid: config.wxid
                }, true).then(json => {
                    console.log(json)
                    if (json.data.url) {
                        if (location.hash && location.hash.length > 1) {
                            this.store.set('backurl', location.hash.substr(1));
                            console.log('跳转授权前保存url', location.hash.substr(1))
                        }
                        location.href = json.data.url;
                    }
                }).catch(err => {
                    console.log(err)
                    this.wechatAuthError()
                    resolve()
                })
            }
        } else {
            resolve()
        }

    })
}

Api.prototype.wechatAuthError = function() {
    this.store.session.add('wechat_error', 1);
}
Api.prototype.setOpenid = function (openid, unbinded=1) {
    this.openid = openid

    this.store.set('openid', openid);
    this.store.set('openid_unbind', unbinded);

    let backurl = this.store.get('backurl');
    if (backurl) {
        console.log('恢复授权前url', backurl)
        this.store.remove('backurl')
    } else {
        backurl = '/'
    }
    
    let newOpenid = this.store.get('openid')
    let newArgs = '?_authed=' + new Date().getTime()
    if(!newOpenid || newOpenid != openid){
        Toast.fail('Unsupport local storage!')
        newArgs = '?openid='+openid
    }

    location.href = config.root + newArgs + '#' + backurl
}

// 保存登录数据到本地
Api.prototype.save = function () {
    if (this.token != '') {
        console.log('将token缓存到本地')
        this.store.set(this.store_key, {
            token: this.token,
            token_time: this.tokenTime,
            token_expire: this.tokenExpire,
            refresh_token: this.refreshToken
        })
    }
}

// 设置登录数据
Api.prototype.setLogin = function (data) {
    this.token = data.token;
    this.tokenTime = Math.floor(new Date().getTime() / 1000)
    this.refreshToken = data.refresh_token
    this.tokenExpire = data.token_expire
    store.commit('setIsLogin', true)
    this.save()
}

// 登录
Api.prototype.login = function (username, password, verify = '') {
    return this.post('auth/login', {
        username: username,
        password: password,
        verify: verify
    })
}

// 刷新队列
Api.prototype.onRefreshEnd = function () {
    var func = this.refreshEnd.shift();
    while (func) {
        func();
        func = this.refreshEnd.shift();
    }
}

// 刷新token
Api.prototype.refresh = function () {

    let promise = new Promise((resolve, reject) => {
        this.refreshEnd.push(() => {
            console.log('refresh 回调')
            if (this.token) {
                resolve();
            } else {
                reject();
            }
        });
    });
    if (!this.isRefreshing) {
        this.isRefreshing = true;
        let currentToken = this.refreshToken
        console.log('刷新 token')
        axios.post('auth/refresh', {
            refresh_token: currentToken
        }).then(res => {
            let json = res.data
            this.isRefreshing = false;
            if (json.code == 1) {
                console.log('刷新 token 成功')
                this.setLogin(json.data)
                this.onRefreshEnd()
            } else {
                if (currentToken == this.refreshToken) {
                    Toast.fail('登录已失效')
                    this.clear()
                }
                this.onRefreshEnd()
            }
        }).catch(() => {
            this.isRefreshing = false;
            this.onRefreshEnd()
        })
    }
    return promise;
}

Api.prototype.clear = function () {
    this.token = ''
    this.refreshToken = ''
    this.tokenExpire = 0
    this.tokenTime = 0
    store.commit('setIsLogin', false)
    store.dispatch('updateUserinfo')
    this.store.remove(this.store_key)
}

// 批量查询接口
Api.prototype.batch = function (queries) {
    return this.post('common/batch', queries);
}

// post
Api.prototype.post = function (api, param = null, force = false) {
    console.log('请求参数: '+ JSON.stringify(param));
    return this.request({
        method: 'post',
        'content-type': 'application/json',
        url: api,
        data: param
    }, force);
}

// get
Api.prototype.get = function (api, force = false) {
    return this.request({
        url: api
    }, force);
}

Api.prototype.needLogin = function () {
    api.clear();
    if (store.state.isLogin) {
        store.commit('setIsLogin', false);
    }
    router.replace({
        path: '/login',
        query: {
            redirect: router.currentRoute.fullPath
        }
    })
}

 Api.prototype.request = function (config, force = false) {
    if (this.blocked && !force) {
        return new Promise((resolve, reject) => {
            reject()
        })
    }
    return new Promise((resolve, reject) => {
        if (this.isRefreshing) {
            //加入刷新队列
            this.refresh().then(() => {
                console.log('重新请求 ' + config.url)
                this.request(config).then(res => {
                    resolve(res)
                }).catch(error => {
                    reject(error)
                })
            }).catch(error => {
                reject(error)
            })
        } else {
            axios.request(config).then(res => {
                let json = res.data
                if (json.code == 103) { //token过期
                    if (this.getToken() == res.config.headers.token) {
                        console.log('自动刷新token')
                        this.refresh().then(() => {
                            this.request(config).then(res => {
                                resolve(res)
                            }).catch(error => {
                                reject(error)
                            })
                        }).catch(error => {
                            reject(error)
                        })
                        return;
                    }

                } else if (json.code == 99) { //需要登录
                    if (!this.hasToken()) {
                        Toast.fail('请登录后操作')
                        this.needLogin()
                        return;
                    }
                } else if (json.code == 102) { //token失效
                    if (this.getToken() == res.config.headers.token) {
                        this.clear()
                    }
                } else if (json.code == 113) { //用户被禁用
                    Toast.fail('您的账号已禁用')
                    this.clear();
                }


                if (json.code == 1) {
                    if (!store.state.firstLoaded) {
                        store.commit('setFirstLoaded', true);
                    }
                    resolve(json)
                } else if ([99, 102, 103, 113].indexOf(json.code) > -1) {
                    this.request(config).then(res => {
                        resolve(res)
                    }).catch(error => {
                        console.log('重复请求失败', error)
                        reject(error)
                    })
                } else {
                    reject(json)
                }
            }).catch(error => {
                reject(error)
            })
        }
    });
}

Api.prototype.wechatReady = function (callback = null) {
    return new Promise((resolve, reject) => {
        if (!config.isWechat || !config.wxid || !this.openid) {
            reject()
            return;
        }
        if (config.signPackage) {
            if (callback) callback(wx)
            resolve(wx)
        } else {
            this.post('auth/wxSign', {
                wxid: config.wxid
            }).then(result => {
                config.signPackage = result.data
                wx.config(config.signPackage)
                if (callback) callback(wx)
                resolve(wx)
            }).catch(error => {
                Toast.fail('配置错误')
                reject(error)
            })
        }
    })
}

/**
 * title: '', // 分享标题
 * desc: '', // 分享描述
 * link: '', // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
 * imgUrl: ''
 */
Api.prototype.wxShare = function (options, isDefault = false) {
    if (isDefault) {
        this.shareData = {
            cancel: () => {
                Toast.fail('分享失败')
            },
            ...options
        };

    } else {
        if (!options.link) {
            options.link = location.href.split('#')[0] + '?path=' + encodeURIComponent(router.currentRoute.fullPath)
        } else {
            if (options.link.indexOf('#') > -1) {
                let parts = options.link.split('#')
                options.link = parts[0] + '?path=' + encodeURIComponent(parts[1])
            }
        }
        options = {
            ...this.shareData,
            ...options
        }
    }
    return new Promise((resolve, reject) => {
        if (!config.isWechat || !config.wxid) {
            resolve()
            return false;
        }
        if (isDefault && this.shareSeted) {
            resolve()
        }
        this.shareSeted = true
        this.wechatReady().then(wx => {
            wx.updateAppMessageShareData(options);
            wx.updateTimelineShareData(options);

            let shareOptions = {
                success: () => {
                    Toast.success('分享成功')
                },
                ...options
            }
            if (wx.onMenuShareTimeline) {
                wx.onMenuShareTimeline(shareOptions);
                wx.onMenuShareAppMessage(shareOptions);
                wx.onMenuShareQQ(shareOptions);
                wx.onMenuShareQZone(shareOptions);
            }

            wx.onMenuShareWeibo(shareOptions);
            resolve()
        }).catch(error => {
            reject(error)
        })
    })
}

Api.prototype.wxPay = function (order_id, type = '') {
    return new Promise((resolve, reject) => {
        if(!config.wxid){
            reject('微信ID未配置')
            return;
        }
        let params = {
            order_id: type + '_' + order_id,
            payid: config.wxid
        };
        if (config.isWechat) {
            params["trade_type"] = "JSAPI";
        } else {
            params["trade_type"] = "MWEB";
        }
        this.post("order/wechatpay", params)
            .then(result => {
                if (result.code == 1) {
                    if (result.data.mweb_url) {
                        //todo 支付成功判断
                        location.href = result.data.mweb_url;
                    } else if (result.data.code_url) {
                        //todo 二维码支付
                        location.href = result.data.code_url;
                    } else if (result.data.payment) {
                        if (result.data.payment.timeStamp) {
                            result.data.payment.timestamp =
                                result.data.payment.timeStamp;
                            delete result.data.payment.timeStamp;
                        }
                        this.wechatReady(wx => {
                            wx.chooseWXPay({
                                ...result.data.payment,
                                success: res => {
                                    console.log(res);
                                    Toast.success("支付成功");
                                    resolve()
                                },
                                fail: res => {
                                    Dialog.alert({
                                        message: "支付发起失败:" + res.errMsg
                                    });
                                    reject()
                                }
                            });
                        });
                    } else {
                        Toast.fail(result.msg || "支付失败");
                        reject()
                    }
                }
            })
            .catch(err => {
                Toast.fail(err.msg || "支付失败");
                reject()
            });
    })
}

const api = new Api();

axios.defaults.baseURL = config.server;

axios.interceptors.request.use(
    request => {
        request.headers['version'] = config.version+' '+(supportStorage?'store':'cookie');
        if (request.url.indexOf('auth/') === 0) {
            if (api.hasAccessToken()) {
                request.headers['Access-Token'] = api.getAccessToken();
            }
        } else {
            // 判断是否存在token，如果存在的话，则每个http header都加上token
            if (api.hasToken()) {
                request.headers.token = api.getToken();
            }
        }

        return request;
    },
    err => {
        return Promise.reject(err);
    });

// http response 拦截器
axios.interceptors.response.use(
    response => {
        return response;
    },
    error => {
        console.log('error:', error)
        if (error.response) {
            return Promise.reject(error.response.data)
        } else {
            return Promise.reject({
                code: 0,
                msg: error
            }) // 返回接口返回的错误信息
        }

    });


export default api