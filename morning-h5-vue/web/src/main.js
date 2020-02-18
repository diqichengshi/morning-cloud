// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue';
import App from './App';
import router from './router';
import iView from 'iview';
import 'iview/dist/styles/iview.css';
// 引入axios，并加到原型链中
import axios from 'axios';

Vue.use(iView);
Vue.config.productionTip = false;

Vue.prototype.$axios = axios;

router.beforeEach((to, from, next) => {
  iView.LoadingBar.start();
  /* 判断该路由是否需要登录权限 */
  if (to.matched.some(record => record.meta.requiresAuth)) {
    // 是否登录
    if (!localStorage.getItem('loginInfo')) {
      console.log('用户未登陆,跳转到登陆页面,重定向页面地址是:' + to.fullPath);
      next({path: '/login', query: {redirectUrl: to.fullPath}});
    } else {
      console.log('用户已登陆,登陆信息' + localStorage.getItem('loginInfo'));
      next();
    }
  } else {
    next();
  }
});

router.afterEach(route => {
  iView.LoadingBar.finish();
});

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
});
