<template>
  <div class="page index" ref="page" @scroll="pageScroll">
    <van-sticky>
      <div :class="navbgClass">
        <van-search
          slot="title"
          placeholder="输入商品名称搜索"
          shape="round"
          background="transparent"
          v-model="value"
          @search="onSearch"
          @cancel="onCancel"
        />
      </div>
    </van-sticky>
    <div class="swipe-box">
      <van-swipe :autoplay="3000">
        <van-swipe-item v-for="(image, index) in images" :key="index">
          <van-image :src="image.image" fit="cover" />
        </van-swipe-item>
      </van-swipe>
    </div>
    <div class="cblock cate-block">
      <van-grid :column-num="4" :border="false" icon-size="50px">
        <van-grid-item
          v-for="cate in cates"
          :key="cate.id"
          :icon="cate.icon"
          :text="cate.title"
          :to="'/product?id='+cate.id"
        />
      </van-grid>
    </div>

    <div v-if="fourads && fourads.length>0" class="four-row">
      <van-row gutter="5">
        <van-col span="12" v-for="item in fourads" :key="item.id">
          <div class="four-box" @click="toUrl(item.url)">
            <van-image :src="item.image" fit="cover" width="100%" height="100%"></van-image>
            <div class="four-text">
              <h4>{{item.title}}</h4>
              <div class="title-vice">{{item.ext?item.ext.vice:''}}</div>
            </div>
          </div>
        </van-col>
      </van-row>
    </div>
    <info-block v-if="goods && goods.length>0" title="积分专区" class="goods-block">
    <goods-list :lists="goods" />
    </info-block>
    <van-divider class="white-divider">推荐产品</van-divider>
    <product-list :lists="products" />
    <van-divider>到底了哦~</van-divider>
  </div>
</template>
<script >
import api from "../../api";
// import utils from "../../utils";

export default {
  name: "home",
  data() {
    return {
      is_loaded: false,
      images: [],
      fourads:[],
      cates: [],
      goods: [],
      products: [],
      value: "",
      navbgClass: "bg-transparent"
    };
  },
  mounted() {
    this.loadData();
  },
  methods: {
    pageScroll() {
      let scrollTop = this.$refs.page.scrollTop;
      if (scrollTop >= window.innerWidth * 0.4) {
        this.navbgClass = "search-box";
      } else {
        this.navbgClass = "search-box bg-transparent";
      }
    },
    loadData() {
      this.loadProductList();
      // api
      //   .post("common/batch", {
      //     "product.get_list": {},
      //     "goods.get_list": {},
      //     "product.get_cates": { pid: 0 },
      //     advs: { flag: "banner" },
      //     fourads: {action:'advs', flag: "fourad" }
      //   })
      //   .then(json => {
      //     if (json.code == 1) {
      //       this.images = utils.fixListImage(json.data.advs);
      //       this.fourads = utils.fixListImage(json.data.fourads);
      //       if (json.data["goods.get_list"]) {
      //         this.goods = utils.fixListImage(
      //           json.data["goods.get_list"]["lists"]
      //         );
      //       }
      //       if (json.data["product.get_list"]) {
      //         this.products = utils.fixListImage(
      //           json.data["product.get_list"]["lists"]
      //         );
      //       }
      //       if (json.data["product.get_cates"]) {
      //         this.cates = utils.fixListImage(
      //           json.data["product.get_cates"],
      //           "icon,image"
      //         );
      //       }
      //       this.is_loaded = true;
      //     }
      //   });
    },
    loadProductList() {
      api.post("/product-service/product/productList",{})
          .then(json => {
            if (json.code == '00') {
              this.products = json.data;
            }else {
              this.$toast('商品列表加载失败~');
            }
          });
    },
    toUrl(url) {
      if(!url){
        this.$toast('功能即将上线~')
        return;
      }
      if(url.indexOf('http://')===0 || url.indexOf('https://')===0){
        location.href = url;
      }else{
        this.$router.push(url)
      }
    },
    onSearch() {
      this.$router.push('/search?keyword='+encodeURIComponent(this.value))
    },
    onCancel() {
      this.value = ''
    },
    sorry() {
      this.$toast('功能即将上线~')
    }
  }
};
</script>
<style lang="scss" >
.index {
  .search-box {
    background: #fff;
    .van-search__content {
      background-color: #ededed;
    }
    &.bg-transparent {
      background: transparent;
    }
  }
  .swipe-box {
    margin: 0 10px;
    position: relative;
    padding-top: 44%;
  }
  .van-swipe {
    height: 100%;
    width: 100%;
    position: absolute;
    left: 0;
    top: 0;
    box-shadow: 1px 1px 10px 2px rgba(0,0,0,.05);
    .van-swipe-item {
      border-radius: 5px;
      overflow: hidden;
    }
    .van-image {
      width: 100%;
      height: 100%;
    }
  }

  .cate-block {
    margin-top: 10px;
    box-shadow: 1px 1px 5px 2px rgba(0,0,0,.02);
    .van-grid-item__content {
      padding-top: 10px;
      padding-bottom: 10px;
    }
    .van-grid-item__text {
      margin-top: 5px;
    }
  }
  .four-row {
    margin: 0 10px;
  }
  .four-box {
    width: 100%;
    padding-top: 53%;
    position: relative;
    margin-bottom: 5px;
    border-radius: 5px;
    overflow: hidden;
    .van-image {
      position: absolute;
      left: 0;
      top: 0;
    }
    .four-text{
      position: absolute;
      left:0;
      top:0;
      padding:10px;
      h4{
        color:#333;
        font-size:14px;
        margin:0;
      }
      .title-vice{
        color:#aa7f4c;
        font-size:12px;
      }
    }
  }
  .goods-block {
    margin: 10px;
    .info-content {
      padding: 10px 0;
    }
    .goods-item{
      background:#fafafa;
    }
  }
  .white-divider {
    background: #fff;
    padding: 10px 0;
    .van-image {
      width: 120px;
    }
  }
}
</style>