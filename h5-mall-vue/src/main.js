import Vue from 'vue';
import Vant from 'vant';
import { Lazyload } from 'vant';
import 'vant/lib/index.css';

import vueg from 'vueg-history';
import router from './router';
import store from './store';
import utils from './utils';
import api from './api';

import App from './App.vue';
import InfoBlock from './views/public/InfoBlock.vue'
import ProductList from './views/public/ProductList.vue'
import GoodsList from './views/public/GoodsList.vue'
//import GroupbuyList from './public/GroupbuyList.vue'
import AddressList from './views/public/AddressList.vue'
//import GroupRule from './public/GroupRule.vue'
import Splash from './views/Splash.vue'

//用于微信分享的页面跳转
let query = utils.parseQuery(location.search)
if(query && query.path){
  location.href = '/#'+query.path
  //防止页面刷新时执行后续逻辑
  throw SyntaxError()
}

if(query && (query['openid'] || query['_authed'])){
  api.wechatAuthed=true
  api.openid = query['openid']
}

Vue.prototype.$api = api;

Vue.use(vueg, router, {
  shadow: false,
  roots: ['index','index-group','index-credit','index-cart','index-member'],
  map: {
    'index':{
      enter: ['index-group','index-credit','index-cart','index-member']
    },
    'index-group':{
      enter: ['index-credit','index-cart','index-member']
    },
    'index-credit':{
      enter: ['index-cart','index-member']
    },
    'index-cart':{
      enter: ['index-member']
    },
  }
});
Vue.use(Vant);
Vue.use(Lazyload);
Vue.component('info-block',InfoBlock)
Vue.component('product-list',ProductList)
Vue.component('goods-list',GoodsList)
//Vue.component('group-list',GroupbuyList)
Vue.component('address-list',AddressList)
//Vue.component('group-rule',GroupRule)
Vue.component('v-splash',Splash)

Vue.config.productionTip = false

let isLogin = false
let defaultShareInfo={
  title:document.title,
  link:location.href.split('#')[0]
};
store.subscribe((mutation, state) => {
  if(mutation.type == 'setIsLogin'){
    if(isLogin != state.isLogin){
      store.dispatch('updateUserinfo')
      isLogin = state.isLogin
    }
  }
  if(mutation.type == 'setSiteinfo'){
    let shareimg = state.siteinfo['shareimg']
    if(!shareimg)shareimg = state.siteinfo['weblogo']
    defaultShareInfo = {
      title: state.siteinfo['webname'],
      desc: state.siteinfo['description'],
      link: state.siteinfo['url'],
      imgUrl: utils.fixImageUrl(shareimg)
    }
    
    api.wxShare(defaultShareInfo, true)
      
  }
})

router.afterEach(()=>{
  if(defaultShareInfo){
    api.wxShare(defaultShareInfo)
  }
})

api.restore()
  .then(()=>{
    console.log('登录初始化完成')
    
    //用于打开子页面自动将首页放入历史记录
    console.log(location.hash)
    if(window.performance && history.replaceState){
      if (window.performance.navigation.type == 1) {
        console.log("页面被刷新")
      }else{
        console.log("首次被加载")
        let curhash = location.hash
        if(curhash){
          let hashQuery=curhash.split('?')
          if(hashQuery[0] != '/'){
            //进入页面非首页时将首页压入历史记录,防止后退就直接退出应用
            history.replaceState(null,document.title,location.origin+location.pathname+'#/')
            history.pushState(null,document.title,location.origin+location.pathname+curhash)
          }
        }
      }
    }

    store.dispatch('updateGlobal');
    new Vue({
      router,
      store,
      render: h => h(App)
    }).$mount('#app')
    
  })


