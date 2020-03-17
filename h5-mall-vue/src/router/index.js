import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from '../views/Index.vue'
import Home from '../views/home/Index.vue'
import Login from '../views/login/Index.vue'
import NotFound from '../views/NotFound.vue'
import store from '../store';

Vue.use(VueRouter)

const routes = [{
    path: '/',
    component: Index,
    children: [{
        path: '',
        name: 'index',
        component: Home
      },
      {
        path: 'product',
        name: 'index-product',
        component: () => import( /* webpackChunkName: "product" */ '../views/product/Index.vue')
      },
      {
        path: 'credit',
        name: 'index-credit',
        component: () => import( /* webpackChunkName: "product" */ '../views/credit/Index.vue')
      },
      {
        path: 'cart',
        name: 'index-cart',
        component: () => import( /* webpackChunkName: "product" */ '../views/order/Cart.vue')
      },
      {
        path: 'member',
        name: 'index-member',
        component: () => import( /* webpackChunkName: "member" */ '../views/member/Index.vue')
      }
    ]
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
  },
  {
    path: '/login/register',
    name: 'register',
    component: () => import( /* webpackChunkName: "login" */ '../views/login/Register.vue')
  },
  {
    path: '/login/forget',
    name: 'forget',
    component: () => import( /* webpackChunkName: "login" */ '../views/login/Forget.vue')
  },
  {
    path: '/search',
    name: 'search',
    component: () => import( /* webpackChunkName: "group" */ '../views/home/Search.vue')
  },
  {
    path: '/product/list/:id',
    name: 'product-list',
    component: () => import( /* webpackChunkName: "product" */ '../views/product/List.vue')
  },
  {
    path: '/product/detail/:id',
    name: 'product-detail',
    component: () => import( /* webpackChunkName: "product" */ '../views/product/Detail.vue')
  },
  {
    path: '/credit/list/:id',
    name: 'credit-list',
    component: () => import( /* webpackChunkName: "credit" */ '../views/credit/List.vue')
  },
  {
    path: '/credit/detail/:id',
    name: 'credit-detail',
    component: () => import( /* webpackChunkName: "credit" */ '../views/credit/Detail.vue')
  },
  {
    path: '/credit/confirm',
    name: 'credit-confirm',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "credit" */ '../views/credit/Confirm.vue')
  },
  {
    path: '/about/index',
    name: 'about',
    component: () => import( /* webpackChunkName: "about" */ '../views/about/Index.vue')
  },
  {
    path: '/member/profile',
    name: 'member-profile',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "member" */ '../views/member/Profile.vue')
  },
  {
    path: '/member/order',
    name: 'member-order',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "member" */ '../views/member/Order.vue')
  },
  {
    path: '/member/order/detail',
    name: 'member-order-detail',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "member" */ '../views/member/OrderDetail.vue')
  },
  {
    path: '/member/credit_order',
    name: 'member-credit_order',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "member" */ '../views/member/CreditOrder.vue')
  },
  {
    path: '/member/credit_order/detail',
    name: 'member-credit_order-detail',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "member" */ '../views/member/CreditOrderDetail.vue')
  },
  {
    path: '/member/express',
    name: 'member-express',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "member" */ '../views/member/Express.vue')
  },
  {
    path: '/member/award_log',
    name: 'member-award_log',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "member" */ '../views/member/AwardLog.vue')
  },
  {
    path: '/member/credit',
    name: 'member-credit',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "member" */ '../views/member/Credit.vue')
  },
  {
    path: '/member/transfer',
    name: 'member-transfer',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "member" */ '../views/member/Transfer.vue')
  },
  {
    path: '/member/coupon',
    name: 'member-coupon',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "member" */ '../views/member/Coupon.vue')
  },
  {
    path: '/member/password',
    name: 'member-password',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "member" */ '../views/member/Password.vue')
  },
  {
    path: '/member/sec_password',
    name: 'member-sec_password',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "member" */ '../views/member/SecPassword.vue')
  },
  {
    path: '/member/cash',
    name: 'member-cash',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "member" */ '../views/member/Cash.vue')
  },
  {
    path: '/member/cash_log',
    name: 'member-cash_log',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "member" */ '../views/member/CashLog.vue')
  },
  {
    path: '/member/finance',
    name: 'member-finance',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "member" */ '../views/member/Finance.vue')
  },
  {
    path: '/member/share',
    name: 'member-share',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "member" */ '../views/member/Share.vue')
  },
  {
    path: '/member/team',
    name: 'member-team',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "member" */ '../views/member/Team.vue')
  },
  {
    path: '/member/address',
    name: 'member-address',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "member" */ '../views/member/Address.vue')
  },
  {
    path: '/member/address/detail',
    name: 'member-address-detail',
    meta: {
      requireAuth: true,
    },
    component: () => import( /* webpackChunkName: "member" */ '../views/member/AddressDetail.vue')
  },
  {
    path: "/404",
    name: "not-found",
    component: NotFound
  },
  {
    path: "*",
    redirect: "/404"
  }
]

const router = new VueRouter({
  routes
})

router.beforeEach((to, from, next) => {
  //console.log('router: ',to.fullPath)
  if (to.meta.requireAuth) { // 判断该路由是否需要登录权限
    if (store.state.isLogin) { // 通过vuex state获取当前的token是否存在
      next();
    } else {
      console.log('save url:',to.fullPath)
      store.commit('setRememberUrl', to.fullPath)
      next({
        path: '/login'
      })
    }
  } else {
    next();
  }
})

export default router