<template>
  <div class="page product-detail">
    <van-nav-bar title="" left-text="" left-arrow @click-left="onClickLeft" />
    <div class="container">
    <van-swipe class="goods-swipe" :autoplay="3000">
      <van-swipe-item v-for="thumb in images" :key="thumb.id">
        <img :src="thumb.image" />
      </van-swipe-item>
    </van-swipe>

    <van-cell-group>
      <van-cell>
        <div class="goods-title">{{ product.title }}</div>
        <div class="goods-price">{{ formatPrice(product.min_price) }}</div>
      </van-cell>
      <van-cell class="goods-express">
        <van-col span="10">运费：{{ postage }}</van-col>
        <van-col span="14">剩余：{{ product.storage }}</van-col>
      </van-cell>
    </van-cell-group>

    <van-cell-group class="goods-cell-group">
      <van-cell title="商品属性" is-link @click="showProp = true" />
      <van-cell title="商品规格" is-link @click="show = true" />
    </van-cell-group>

    <van-cell-group class="goods-cell-group">
      <van-cell title="查看商品详情" is-link @click="showContent = true" />
    </van-cell-group>
    </div>

    <van-goods-action>
      <van-goods-action-icon icon="chat-o" @click="sorry">客服</van-goods-action-icon>
      <van-goods-action-icon icon="cart-o" @click="onClickCart">购物车</van-goods-action-icon>
      <van-goods-action-button type="warning" @click="onAddCartClicked">加入购物车</van-goods-action-button>
      <van-goods-action-button type="danger" @click="onBuyClicked">立即购买</van-goods-action-button>
    </van-goods-action>

    <van-sku
      v-model="show"
      :sku="sku"
      :goods="goods"
      :goods-id="product.id"
      :quota="quota"
      :quota-used="quotaUsed"
      :hide-stock="sku?sku.hide_stock:false"
      :message-config="messageConfig"
      @buy-clicked="onBuyClicked"
      @add-cart="onAddCartClicked"
    />
    <van-popup v-model="showProp" closeable position="bottom">
      <div class="pop-container">
        <van-cell-group>
          <van-cell v-for="(val, key) in product.prop_data" :key="key" :title="key" :value="val" />
        </van-cell-group>
      </div>
    </van-popup>
    <van-popup v-model="showContent" closeable position="bottom">
      <div v-if="product.content" class="pop-container pop-html">
        <van-nav-bar title="产品详情" left-text="返回" left-arrow @click-left="showContent=false" />
        <div class="html-content" v-html="product.content"></div>
      </div>
      <div v-else class="empty-box">暂无介绍~</div>
    </van-popup>
  </div>
</template>

<script>
import api from "../../api";
import utils from "../../utils";

export default {
  components: {},

  data() {
    return {
      id: 0,
      images: [],
      sku:null,
      skus: [],
      is_favourite: false,
      postage: '',
      product: {
        title: "",
        price: 0,
        express: "免运费",
        remain: 0,
      },
      show: false,
      showProp: false,
      showContent: false
    };
  },
  computed: {
    hasProp() {
      return (
        this.product.prop_data &&
        Object.values(this.product.prop_data).length > 0
      );
    }
  },
  mounted() {
    let id = this.$route.params.id
    if(!id){
      this.$toast.fail('参数错误')
      this.$router.back()
    }else{
      this.id = id
      this.loadData()
    }
  },
  methods: {
    loadData() {
      api.post('product/view',{
        id: this.id
      }).then(res=>{
        res.data.product.image = utils.fixImageUrl(res.data.product.image)

        this.postage = res.data.postage
        this.product = res.data.product
        //this.images = res.data.images
        this.is_favourite = res.data.is_favourite == 1
        this.skus = utils.fixListImage(res.data.skus)
        if(!res.data.images || res.data.images.length<1){
          this.images = [{
            id: 0,
            image: this.product.image
          }]
        }else{
          this.images = utils.fixListImage(res.data.images)
        }
      }).catch((error)=>{
        console.log(error)
        this.$toast.fail('产品资料错误')
        this.$router.back()
      })
    },
    formatPrice(price) {
      return "¥" + (Math.round(price * 100) / 100).toFixed(2);
    },
    onClickLeft() {
      this.$router.back();
    },
    onClickCart() {
      this.$router.push("index-cart");
    },
    onBuyClicked() {

    },
    onAddCartClicked() {

    },
    sorry() {
      this.$toast("暂无后续逻辑~");
    }
  }
};
</script>

<style lang="scss">
.product-detail{
.van-nav-bar{
  background:transparent;
  position: fixed;
  .van-icon{
    color:#fff;
    text-shadow: 1px 2px 5px rgba(0,0,0,.3);
  }
}
}
.goods {
  padding-bottom: 50px;

  &-swipe {
    img {
      width: 100%;
      display: block;
    }
  }

  &-title {
    font-size: 16px;
  }

  &-price {
    color: #f44;
  }

  &-express {
    color: #999;
    font-size: 12px;
    padding: 5px 15px;
  }

  &-cell-group {
    margin: 15px 0;

    .van-cell__value {
      color: #999;
    }
  }

  &-tag {
    margin-left: 5px;
  }
}
</style>
