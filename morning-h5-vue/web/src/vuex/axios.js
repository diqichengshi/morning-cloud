import axios from 'axios';
import {Toast} from 'mint-ui'; // 我用的mint的框架来弹出我的错误返回 大家可以用别的提示
import router from '../router';

// 默认超时设置
axios.defaults.timeout = 50000;

// 相对路径设置
axios.defaults.baseURL = '';
// 也可以不需要
// const _baseUrl = process.env.API_URL; // 这里我在项目配置文件里面设置了相对路径

// http request 拦截器
axios.interceptors.request.use(
  config => {
    // 获取token
    const token = localStorage.getItem('cc_token');
    // 设置参数格式
    if (!config.headers['Content-Type']) {
      config.headers = {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*'
      };
    }
    // 添加token到headers
    if (token) {
      config.headers.token = token;
    }
    // 鉴权参数设置
    if (config.method === 'get') {
      // get请求下 参数在params中，其他请求在data中
      config.params = config.params || {};
      // let json = JSON.parse(JSON.stringify(config.params));
      // 一些参数处理
      // console.log(json);
    } else {
      config.data = config.data || {};
      // 一些参数处理
      // console.log(config.data);
    }
    return config;
  },
  err => {
    return Promise.reject(err);
  }
);

// 以上请求之前的一些处理就完成了，下面是获得返回的一些处理
// http response 拦截器
axios.interceptors.response.use(
  response => {
    // 一些统一code的返回处理
    if (response.data.code === 501) {
      // 登录验证
      // 做了个示例跳转项目中登录，并记录下相对路径
      router.push({
        name: 'login', // 从哪个页面跳转
        query: {
          retUrl: window.location.href.split('#')[1] || '',
          is_new_user_url: 1
        }
      });
    }
    return response;
  },
  error => {
    return Promise.reject(error);
  }
);

// 接着把所有请求类型都做下简单封装
/**
 * 封装get方法
 * @param url
 * @param params
 * @returns {Promise}
 */
export function fetch (url, params = {}) {
  return new Promise((resolve, reject) => {
    axios.get(url, {
      params: params
    }).then(response => {
      // console.log('请求' + url + '响应数据' + response.data);
      if (response.data.code === 200) {
        // 返回成功处理  这里传的啥 后续调用的时候 res就是啥
        resolve(response.data.result); // 我们后台所有数据都是放在返回的data里所以这里统一处理了
      } else {
        console.log('请求异常' + url + '响应数据' + JSON.stringify(response.data));
        // 错误处理
        Toast(response.data.msg);
      }
    }).catch(err => {
      reject(err);
      let message = '请求失败！请检查网络';
      // 错误返回
      if (err.response) message = err.response.data.message;
      Toast(message);
    });
  });
}

/**
 * 封装post请求
 * @param url
 * @param data
 * @returns {Promise}
 */

export function post (url, data = {}) {
  return new Promise((resolve, reject) => {
    axios.post(url, data)
      .then(response => {
        console.log(url + '响应' + response);
        if (response.data.code === 200) {
          resolve(response.data.data);
        } else {
          Toast(response.data.msg);
        }
      }, err => {
        reject(err);
        let message = '请求失败！请检查网络';
        if (err.response) message = err.response.data.message;
        Toast(message);
      });
  });
}

/**
 * 封装patch请求
 * @param url
 * @param data
 * @returns {Promise}
 */

export function patch (url, data = {}) {
  return new Promise((resolve, reject) => {
    axios.patch(url, data)
      .then(response => {
        if (response.data.code === 200) {
          resolve(response.data.data);
        } else {
          Toast(response.data.msg);
        }
      }, err => {
        reject(err);
        let message = '请求失败！请检查网络';
        if (err.response) message = err.response.data.message;
        Toast(message);
      });
  });
}

/**
 * 封装put请求
 * @param url
 * @param data
 * @returns {Promise}
 */

export function put (url, data = {}) {
  return new Promise((resolve, reject) => {
    axios.put(url, data)
      .then(response => {
        if (response.data.code === 200) {
          resolve(response.data.data);
        } else {
          Toast(response.data.msg);
        }
      }, err => {
        reject(err);
        let message = '请求失败！请检查网络';
        if (err.response) message = err.response.data.message;
        Toast(message);
      });
  });
}

export function del (url, data = {}) {
  return new Promise((resolve, reject) => {
    axios.delete(url, data)
      .then(response => {
        if (response.data.code === 200) {
          resolve(response.data.data);
        } else {
          Toast(response.data.msg);
        }
      }, err => {
        reject(err);
        let message = '请求失败！请检查网络';
        if (err.response) {
          message = err.response.data.message;
        }
        Toast(message);
      });
  });
}
