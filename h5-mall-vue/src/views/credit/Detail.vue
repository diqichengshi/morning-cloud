<template>
  <div class="page goods-detail">
    <van-nav-bar class="topnavbar" title left-text left-arrow @click-left="onClickLeft" />
    <div class="container">
      <van-swipe class="goods-swipe" :autoplay="3000">
        <van-swipe-item v-for="thumb in images" :key="thumb.id">
          <img :src="thumb.image" />
        </van-swipe-item>
      </van-swipe>

      <van-cell-group>
        <van-cell>
          <div class="goods-title">{{ product.title }}</div>
          <div class="goods-price">
            {{ release_price }} + {{credit}}
            <van-icon name="diamond-o"></van-icon>
          </div>
        </van-cell>
        <van-cell class="goods-express">
          <van-col span="10">运费：{{ postage }}</van-col>
          <van-col span="14">剩余：{{ product.storage }}</van-col>
        </van-cell>
      </van-cell-group>

      <van-cell-group v-if="hasProp" class="goods-cell-group">
        <van-cell title="商品属性" is-link @click="showProp = true" />
      </van-cell-group>

      <van-panel class="margin-top" title="商品详情"></van-panel>
      <div v-if="product.content" class="html-content" v-html="product.content"></div>
      <div v-else class="empty-box">暂无介绍~</div>
    </div>
    <van-goods-action>
      <van-goods-action-icon icon="chat-o" @click="sorry">客服</van-goods-action-icon>
      <van-goods-action-button type="danger" @click="onBuyClicked">立即购买</van-goods-action-button>
    </van-goods-action>

    <van-popup v-model="showProp" closeable position="bottom">
      <div class="pop-container">
        <van-cell-group>
          <van-cell v-for="(val, key) in product.prop_data" :key="key" :title="key" :value="val" />
        </van-cell-group>
      </div>
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
      show: false,
      images: [],
      //skus: [],
      is_favourite: false,
      postage: "",
      product: {
        title: "",
        price: 0,
        express: "免运费",
        remain: 0
      },

      showProp: false
    };
  },
  computed: {
    hasProp() {
      return (
        this.product.prop_data &&
        Object.values(this.product.prop_data).length > 0
      );
    },
    credit_rate() {
      if (!this.$store.state.config) {
        return 1;
      }
      if (!this.$store.state.config.credit_rate) {
        return 1;
      }
      return this.$store.state.config.credit_rate;
    },
    percent() {
      if (!this.$store.state.config) {
        return 0;
      }
      if (!this.$store.state.config.deduction) {
        return 0;
      }
      return this.$store.state.config.deduction;
    },
    credit() {
      let credit_rate = this.credit_rate
      if(this.product.credit_rate){
        credit_rate = this.product.credit_rate
      }
      return Math.round(
        this.product.price * this.percent * 0.01 * credit_rate
      );
    },
    release_price() {
      let credit_rate = this.credit_rate
      if(this.product.credit_rate){
        credit_rate = this.product.credit_rate
      }
      return this.product.price - Math.round(this.credit * 100 / credit_rate)*0.01;
    }
  },
  mounted() {
    let id = this.$route.params.id;
    if (!id) {
      this.$toast.fail("参数错误");
      this.$router.back();
    } else {
      this.id = id;
      this.loadData();
    }
    this.$store.dispatch("checkUserinfo");
  },
  methods: {
    loadData() {
      api
        .post("goods/view", {
          id: this.id
        })
        .then(res => {
          res.data.goods.image = utils.fixImageUrl(res.data.goods.image);

          this.postage = res.data.postage;
          res.data.goods.content = utils.parseHtml(res.data.goods.content)
          this.product = res.data.goods;
          //this.images = res.data.images
          this.is_favourite = res.data.is_favourite == 1;
          //this.skus = utils.fixListImage(res.data.skus)
          if (!res.data.images || res.data.images.length < 1) {
            this.images = [
              {
                id: 0,
                image: this.product.image
              }
            ];
          } else {
            this.images = utils.fixListImage(res.data.images);
          }
          this.$api.wxShare({
              title: this.product.title,
              desc: this.product.vice_title,
              imgUrl: this.product.image
            })
        })
        .catch(error => {
          console.log(error);
          this.$toast.fail("产品资料错误");
          this.$router.back();
        });
    },
    onClickLeft() {
      this.$router.back();
    },
    onBuyClicked() {
      this.$router.push("/credit/confirm?goods_id=" + this.product.id);
    },
    sorry() {
      this.$toast("功能未上线~");
    }
  }
};
</script>

<style lang="scss">
.goods-detail {
  .topnavbar {
    background: transparent;
    position: fixed;
    .van-icon {
      color: #fff;
      text-shadow: 1px 2px 5px rgba(0, 0, 0, 0.3);
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
    &:before {
      content: "¥";
      font-size: 12px;
    }
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
