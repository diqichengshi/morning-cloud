<template>
  <div class="page product-index">
    <van-sidebar v-model="activeKey" @change="setCate">
      <van-sidebar-item v-for="cate in cates" :key="cate.id" :title="cate.title" />
    </van-sidebar>
    <div class="page-content">
      <van-image v-if="cates[activeKey] && cates[activeKey].image" :src="cates[activeKey].image"></van-image>
      <goods-list class="margin-top10" v-if="products && products.length>0" :lists="products" ></goods-list>
      <div v-else-if="isLoading"><van-loading size="24px">加载中...</van-loading></div>
      <div v-else class="empty-box"> 该类目暂无内容 </div>
    </div>
  </div>
</template>
<script >
import api from "../../api";
import utils from "../../utils";

export default {
  data() {
    return {
      activeKey: 0,
      isLoading: true,
      cates: [],
      products: []
    };
  },
  mounted() {
    this.loadData()
  },
  methods: {
    loadData() {
      api.post("goods/get_cates", { pid: 0 }).then(json => {
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
      api.post("goods/get_list", { cate: cateid }).then(json => {
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