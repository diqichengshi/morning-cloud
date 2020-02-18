import Vue from 'vue';
import Router from 'vue-router';
import Index from '@/view/Index';

const Login = resolve => require(['@/view/Login'], resolve);
const SignUp = resolve => require(['@/view/SignUp'], resolve);
const CheckPhone = resolve => require(['@/view/signUp/CheckPhone'], resolve);
const InputInfo = resolve => require(['@/view/signUp/InputInfo'], resolve);
const SignUpDone = resolve => require(['@/view/signUp/SignUpDone'], resolve);
const GoodsList = resolve => require(['@/view/GoodsList'], resolve);
const GoodsDetail = resolve => require(['@/view/GoodsDetail'], resolve);
const ShoppingCart = resolve => require(['@/view/ShoppingCart'], resolve);
const Order = resolve => require(['@/view/Order'], resolve);
const Pay = resolve => require(['@/view/Pay'], resolve);
const PayDone = resolve => require(['@/view/PayDone'], resolve);
const Freeback = resolve => require(['@/view/Freeback'], resolve);
const Home = resolve => require(['@/view/Home'], resolve);
const MyAddress = resolve => require(['@/view/home/MyAddress'], resolve);
const AddAddress = resolve => require(['@/view/home/AddAddress'], resolve);
const MyOrder = resolve => require(['@/view/home/MyOrder'], resolve);
const MyShoppingCart = resolve => require(['@/view/home/MyShoppingCart'], resolve);
const Merchant = resolve => require(['@/view/Merchant'], resolve);

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/', // 首页
      name: 'Index',
      component: Index
    },
    {
      path: '/Login', // 登录
      name: 'Login',
      component: Login
    },
    {
      path: '/SignUp', // 注册
      name: 'SignUp',
      component: SignUp,
      children: [
        {
          path: '/',
          name: 'index',
          component: CheckPhone
        },
        {
          path: 'checkPhone',
          name: 'CheckPhone',
          component: CheckPhone
        },
        {
          path: 'inputInfo',
          name: 'InputInfo',
          component: InputInfo
        },
        {
          path: 'signUpDone',
          name: 'SignUpDone',
          component: SignUpDone
        }
      ]
    },
    {
      path: '/goodsList', // 商品列表
      name: 'GoodsList',
      component: GoodsList
    },
    {
      path: '/goodsDetail', // 商品详情
      name: 'GoodsDetail',
      component: GoodsDetail
    },
    {
      path: '/shoppingCart', // 商品详情
      name: 'ShoppingCart',
      component: ShoppingCart
    },
    {
      path: '/order', // 订单页面
      name: 'Order',
      component: Order,
      meta: {requiresAuth: true} // 设置当前路由需要校验
    },
    {
      path: '/pay', // 支付页面
      name: 'Pay',
      component: Pay
    },
    {
      path: '/payDone', // 支付成功页面
      name: 'PayDone',
      component: PayDone
    },
    {
      path: '/freeback', // 反馈页面
      name: 'Freeback',
      component: Freeback
    },
    {
      path: '/home', // 主页
      name: 'Home',
      component: Home,
      children: [
        {
          path: '/',
          name: 'HomeIndex',
          component: MyOrder
        },
        {
          path: 'myAddress',
          name: 'MyAddress',
          component: MyAddress
        },
        {
          path: 'addAddress',
          name: 'AddAddress',
          component: AddAddress
        },
        {
          path: 'myOrder',
          name: 'MyOrder',
          component: MyOrder
        },
        {
          path: 'myShoppingCart',
          name: 'MyShoppingCart',
          component: MyShoppingCart
        }
      ]
    },
    {
      path: '/merchant',
      name: 'Merchant',
      component: Merchant
    }
  ]
});
