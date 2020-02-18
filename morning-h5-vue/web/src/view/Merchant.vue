<template>
  <div>
    <ShopHeader></ShopHeader>
    <div class="goods-container">
      <div class="goods-list">
        <div class="goods-show-info" v-for="(item, index) in goodsList" :key="index">
          <div class="goods-show-img">
            <router-link to="/goodsDetail"><img :src="item.picImg"/></router-link>
          </div>
          <div class="goods-show-price">
            <span>
              <Icon type="social-yen text-danger"></Icon>
              <span class="seckill-price text-danger">{{item.showPrice}}</span>
            </span>
          </div>
          <div class="goods-show-detail">
            <span>{{item.name}}</span>
          </div>
          <div class="goods-show-num">
            已有<span>{{item.commentNumber}}</span>人评价
          </div>
        </div>
      </div>
      <div class="goods-page">
        <Page :total="100" show-sizer></Page>
      </div>
    </div>
  </div>
</template>

<script>
import ShopHeader from '@/view/header/ShopHeader';
import store from '@/vuex/store';
import {productListApi, niceProductListApi} from '../vuex/api';

export default {
  name: 'Merchant',
  data () {
    return {
      niceGoodsList: [], // 精选商品列表
      goodsList: [] // 商品列表
    };
  },
  created () {
    productListApi('').then(res => {
      // console.log('查询商品列表数据' + JSON.stringify(res.list));
      this.goodsList = res.list;
    });
    niceProductListApi('').then(res => {
      // console.log('查询精选商品列表数据' + JSON.stringify(res));
      this.niceGoodsList = res;
    });
  },
  computed: {
  },
  methods: {
  },
  components: {
    ShopHeader
  },
  store
};
</script>

<style scoped>
.text-danger {
  color: #A94442;
}
.seckill-price{
  margin-right: 5px;
  font-size: 25px;
  font-weight: bold;
}
.goods-container {
  margin: 15px auto;
  width: 80%;
}
.goods-list {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
.goods-show-info{
  width: 240px;
  padding: 10px;
  margin: 15px 0px;
  border: 1px solid #fff;
  cursor: pointer;
}
.goods-show-info:hover{
  border: 1px solid #ccc;
  box-shadow: 0px 0px 15px #ccc;
}
.goods-show-price{
  margin-top: 6px;
}
.goods-show-detail{
  font-size: 12px;
  margin: 6px 0px;
}
.goods-show-num{
  font-size: 12px;
  margin-bottom: 6px;
  color: #009688;
}
.goods-show-num span{
  color: #005AA0;
  font-weight: bold;
}
.goods-show-seller{
  font-size: 12px;
  color:#E4393C;
}
.goods-page {
  margin-top: 20px;
  display: flex;
  justify-content: flex-end;
}
</style>
