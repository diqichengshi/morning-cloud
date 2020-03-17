import Vue from 'vue'
import Vuex from 'vuex'
import api from '../api'

Vue.use(Vuex)

export default new Vuex.Store({
  strict: process.env.NODE_ENV !== 'production',
  state: {
    cartCount: 0,
    firstLoaded: false,
    wechatChecked:false,
    isLogin: false,
    userinfo: {},
    siteinfo: {},
    config: { percent: 10 },
    rememberUrl:''
  },
  mutations: {
    setCartCount(state, count) {
      state.cartCount = count
    },
    setUserinfo(state, info) {
      if(!info.avatar){
        info.avatar = '/static/avatar-default.png';
      }
      state.userinfo = info
    },
    setUserinfoPart(state, info) {
      let userinfo = state.userinfo
      this.commit('setUserinfo',{...userinfo,...info});
    },
    setSiteinfo(state, info) {
      state.siteinfo = info
    },
    setIsLogin(state, isLogin) {
      state.isLogin = isLogin
    },
    setWechatChecked(state, wechatChecked) {
      state.wechatChecked = wechatChecked
    },
    setFirstLoaded(state, isLoaded) {
      state.firstLoaded = isLoaded
    },
    setConfig(state, config){
      state.config = config
    },
    setRememberUrl(state, url){
      state.rememberUrl = url
    }
  },
  actions: {
    updateCartCount(context) {
      if (context.state.isLogin) {
        api.get('cart/getcount').then(json => {
          if (json.code == 1) {
            context.commit('setCartCount', json.data)
          }
        })
      } else {
        context.commit('setCartCount', 0)
      }
    },
    checkUserinfo(context) {
      if(context.state.isLogin && (!context.state.userinfo || context.state.userinfo.id <= 0)){
        context.dispatch('updateUserinfo')
      }
    },
    updateUserinfo(context) {
      return new Promise((resolve) => {
        if (context.state.isLogin) {
          api.get('member/profile').then(json => {
            if (json.code == 1) {
              context.commit('setUserinfo', json.data)
              resolve()
            }
          })
        } else {
          context.commit('setUserinfo', {
            id: 0,
            nickname: '请登录',
            avatar: '/static/avatar-default.png'
          })
          resolve()
        }
      })
    },
    updateGlobal(context) {
      return new Promise((resolve,reject) => {
        api.post('common/batch',{
          siteinfo:{},
          config:{group:'credit,groupbuy,member'}
        }).then(json => {
          if (json.code == 1) {
            if(json.data.siteinfo){
              context.commit('setSiteinfo', json.data.siteinfo)
            }
            if(json.data.config){
              let config = {}
              for(let i in json.data.config){
                config = {...config, ...json.data.config[i]}
              }
              
              context.commit('setConfig', config)
            }
            resolve()
          }
        }).catch(err=>{
          reject(err)
        })
      });
    },
    updateSiteinfo(context) {
      api.get('common/siteinfo').then(json => {
        if (json.code == 1) {
          context.commit('setSiteinfo', json.data)
        }
      })
    },
    updateConfig(context){
      return new Promise((resolve,reject) => {
        api.post('common/config',{group:'credit,groupbuy,member'}).then(json => {
          if (json.code == 1) {
            let config = {}
            for(let i in json.data){
              config = {...config, ...json.data[i]}
            }
            
            context.commit('setConfig', config)
            resolve()
          }
        }).catch(err=>{
          reject(err)
        })
      });
    }
  }
})