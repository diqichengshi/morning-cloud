<template>
  <div>
    <Search></Search>
    <ShopHeader></ShopHeader>
    <GoodsDetailNav></GoodsDetailNav>
    <div class="shop-item-path">
      <div class="shop-nav-container">
        <Breadcrumb>
          <BreadcrumbItem to="/">首页</BreadcrumbItem>
          <BreadcrumbItem to="/goodsList">手机壳</BreadcrumbItem>
          <BreadcrumbItem>手机保护套</BreadcrumbItem>
        </Breadcrumb>
      </div>
    </div>
    <!-- 商品信息展示 -->
    <ShowGoods v-if="!isLoading" :goods-info="goodsInfo"></ShowGoods>
    <!-- 商品详细展示 -->
    <ShowGoodsDetail v-if="!isLoading" :goods-info="goodsInfo"></ShowGoodsDetail>
    <Spin size="large" fix v-if="isLoading"></Spin>
  </div>
</template>

<script>
import Search from '@/view/Search';
import GoodsDetailNav from '@/view/nav/GoodsDetailNav';
import ShopHeader from '@/view/header/ShopHeader';
import ShowGoods from '@/view/goodsDetail/ShowGoods';
import ShowGoodsDetail from '@/view/goodsDetail/ShowGoodsDetail';
import store from '@/vuex/store';
import {productDetailApi} from '../vuex/api';

export default {
  name: 'GoodsDetail',
  beforeRouteEnter (to, from, next) {
    window.scrollTo(0, 0);
    next();
  },
  created () {
    this.productId = this.$route.query.productId;
    // console.log('加载商品详情,商品Id=' + this.productId);
    productDetailApi(this.productId).then(res => {
      this.goodsInfo = res;
      // console.log('查询商品列表详情数据' + JSON.stringify(this.goodsInfo));
      this.isLoading = false;
    });
  },
  activated () {
  },
  data () {
    return {
      productId: '',
      goodsInfo: {
        productId: '',
        shopId: '',
        name: '',
        bigImg: '',
        smallImg: [],
        showPrice: '',
        commentNumber: '',
        commentNumDetail: '',
        tags: [],
        discount: [],
        promotion: [],
        detail: '',
        parameter: [],
        kindList: [],
        hotProductList: [],
        conmmentDetail: {
          goodAnalyse: 90,
          conmmentTags: [],
          conmmentList: []
        }
      },
      tagsColor: [ 'blue', 'green', 'red', 'yellow' ],
      isLoading: true
    };
  },
  methods: {
  },
  computed: {
  },
  components: {
    Search,
    ShopHeader,
    GoodsDetailNav,
    ShowGoods,
    ShowGoodsDetail
  },
  store
};
</script>

<style scoped>
.shop-item-path {
  height: 38px;
  background-color: rgb(236, 235, 235);
  line-height: 38px;
  color: #2c2c2c;
}
.shop-nav-container {
  margin: 0px auto;
  width: 80%;
}
</style>
