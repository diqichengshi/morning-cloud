<template>
  <div class="page order-cart">
    <van-nav-bar title="购物车" left-text="返回" left-arrow @click-left="onClickLeft" />
    
    <div v-if="!isLogin" class="login-btn-box">
      <van-button type="info" plain hairline round  @click="goLogin">登录查看</van-button>
    </div>
    <div v-else-if="isLoading">
      <van-skeleton title avatar avatar-shape="square" avatar-size="50" :row="3" />
    </div>
    <div v-else-if="!goods || goods.length<1" class="empty-box">
      <div>购物车暂时没有内容</div>
      <van-button type="info" plain hairline round  @click="goHome">去商城看看</van-button>
    </div>
    <div v-else>
    <van-checkbox-group class="card-goods" v-model="checkedGoods">
      <van-checkbox class="card-goods__item" v-for="item in goods" :key="item.id" :name="item.id">
        <van-card
          :title="item.product_title"
          :desc="item.desc"
          :num="item.count"
          :price="formatPrice(item.price)"
          :thumb="item.image"
        />
      </van-checkbox>
    </van-checkbox-group>
    <van-submit-bar
      :price="totalPrice"
      :disabled="!checkedGoods.length"
      :button-text="submitBarText"
      @submit="onSubmit"
    />
    </div>
  </div>
</template>

<script>
import api from '../../api';
import store from '../../store';
import utils from '../../utils';


export default {
  components: {},

  data() {
    return {
      isLoading: true,
      checkedGoods: [],
      goods: [ ]
    };
  },

  computed: {
    submitBarText() {
      const count = this.checkedGoods.length;
      return "结算" + (count ? `(${count})` : "");
    },
    isLogin(){
      return store.state.isLogin
    },
    member(){
      return store.state.userinfo
    },
    totalPrice() {
      return this.goods.reduce(
        (total, item) =>
          total + (this.checkedGoods.indexOf(item.id) !== -1 ? item.price : 0),
        0
      );
    }
  },
  mounted() {
    if(store.state.isLogin){
      this.loadData()
    }
  },
  methods: {
    formatPrice(price) {
      return (price / 100).toFixed(2);
    },
    goLogin() {
      this.$router.push('/login')
    },
    goHome() {
      this.$router.push('/')
    },
    onSubmit() {
      this.$toast("点击结算");
    },

    onClickLeft() {
      this.$router.back();
    },
    loadData() {
      
      api.post('cart/getall').then(res=>{
        this.isLoading=false;
        this.goods = utils.fixListImage(res.data)
      }).catch(err=>{
        this.isLoading=false;
        this.$toast.fail(err.msg||'获取购物车失败')
      })
    }
  }
};
</script>

<style lang="scss">
.order-cart {
  .card-goods {
    padding: 10px 0;

    &__item {
      position: relative;
      background-color: #fff;

      .van-checkbox__label {
        width: 100%;
        height: auto; // temp
        padding: 0 10px 0 15px;
        box-sizing: border-box;
      }

      .van-checkbox__icon {
        top: 50%;
        left: 10px;
        z-index: 1;
        position: absolute;
        margin-top: -10px;
      }

      .van-card__price {
        color: #f44;
      }
    }
  }

  .van-submit-bar {
    position: absolute;
  }
}
.login-btn-box{
  text-align: center;
  margin-top:50px;
}
</style>
