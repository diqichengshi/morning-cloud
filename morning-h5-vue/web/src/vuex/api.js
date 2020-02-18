import Vue from 'vue';
import {post, fetch, patch, put, del} from './axios';

Vue.prototype.$post = post;
Vue.prototype.$fetch = fetch;
Vue.prototype.$patch = patch;
Vue.prototype.$put = put;
Vue.prototype.$del = del;

// 商品列表方法
const productListURL = `/api/product-service/product/productList`;
export const productListApi = function () {
  return Vue.prototype.$fetch(productListURL);
};

// 精选商品列表
const niceProductListURL = `/api/product-service/product/niceProductList`;
export const niceProductListApi = function () {
  return Vue.prototype.$fetch(niceProductListURL);
};

// 商品详情
const productDetailURL = `/api/product-service/product/productDetail`;
export const productDetailApi = function (productId) {
  return Vue.prototype.$fetch(productDetailURL, {'productId': productId});
};

// 秒杀商品列表
const seckillProductListURL = `/api/product-service/product/seckillProductList`;
export const seckillProductListApi = function () {
  return Vue.prototype.$fetch(seckillProductListURL);
};

// 电脑专栏
const homeComputerListURL = `/api/product-service/advert/homeComputerList`;
export const homeComputerListApi = function () {
  return Vue.prototype.$fetch(homeComputerListURL);
};

// 爱吃专栏
const homeEatListURL = `/api/product-service/advert/homeEatList`;
export const homeEatListApi = function () {
  return Vue.prototype.$fetch(homeEatListURL);
};

// 商品推荐列表方法
const recommendListURL = `/api/product-service/recommend/recommendList`;
export const recommendListApi = function () {
  return Vue.prototype.$fetch(recommendListURL);
};

// ==================================用户相关============================================
// 登陆
const loginURL = `/api/user-service/user/login`;
export const loginApi = function (json) {
  return Vue.prototype.$post(loginURL, {'userName': json.userName, 'passwd': json.password});
};
// 收获地址列表
const addressListURL = `/api/user-service/user/addressList`;
export const addressListApi = function (userId) {
  return Vue.prototype.$fetch(addressListURL, {'userId': userId});
};


// ==================================购物车相关============================================
const addShoppingCartURL = `/api/order-service/cart/addProduct`;
export const addShoppingCartApi = function (json) {
  const data = {
    userId: '1',
    productId: json.productId,
    buyNumber: json.count,
    kindId: json.package.kindId,
    kindName: json.package.kindName
  };
  return Vue.prototype.$post(addShoppingCartURL, data);
};
