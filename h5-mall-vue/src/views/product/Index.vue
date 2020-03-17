<template>
  <div class="page product-index">
    <van-sidebar v-model="activeKey" @change="setCate">
      <van-sidebar-item v-for="cate in cates" :key="cate.id" :title="cate.title" />
    </van-sidebar>
    <div class="page-content">
      <van-image v-if="cates[activeKey] && cates[activeKey].image" :src="cates[activeKey].image"></van-image>
      <product-list v-if="products && products.length>0" :lists="products" :boxWidth="boxWidth"></product-list>
      <div v-else-if="isLoading"><van-loading size="24px">加载中...</van-loading></div>
      <div v-else class="empty-box"> 该类目暂无内容 </div>
    </div>
  </div>
</template>
<script >
import Vue from "vue";
import api from "../../api";
import utils from "../../utils";
import ProductList from "../public/ProductList";

Vue.use('product-list',ProductList)

export default {
  data() {
    let boxWidth=window.innerWidth-85
    return {
      activeKey: 0,
      isLoading: true,
      cates: [],
      products: [],
      boxWidth:boxWidth
    };
  },
  mounted() {
    this.loadData()
  },
  methods: {
    loadData() {
      api.post("product/get_cates", { pid: 0 }).then(json => {
        if (json.code == 1) {
          this.cates = utils.fixListImage(json.data, 'icon,image');
          this.loadProducts()
        }
      });
    },
    loadProducts() {
      let cateid=0
      if(this.cates[this.activeKey]){
        cateid = this.cates[this.activeKey].id
      }
      api.post("product/get_list", { cate: cateid }).then(json => {
        this.isLoading=false
        if (json.code == 1) {
          this.products = utils.fixListImage(json.data.lists);
        }
      });
    },
    setCate() {
      this.isLoading=true
      this.loadProducts()
    }
  }
};
</script>
<style lang="scss">
.van-sidebar{
  height: calc( 100vh - 50px );
  background: #fafafa;
  position: fixed;
}
.page-content{
  padding-left:85px;
}
</style>