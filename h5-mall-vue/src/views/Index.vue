<template>
  <div class="page page-index">
    <div class="router-box">
      <router-view v-transition />
    </div>
    <van-tabbar v-model="active" active-color="#bb0000" route>
      <van-tabbar-item
        name="home" 
        to="/"
        :icon="active=='home'?'wap-home':'wap-home-o'"
      >
        商城首页
      </van-tabbar-item>
      <van-tabbar-item
        name="product" 
        to="/product"
        :icon="active=='product'?'bag':'bag-o'"
      >
        产品中心
      </van-tabbar-item>
      <van-tabbar-item
        name="cart" 
        to="/cart"
        :icon="active=='cart'?'cart':'cart-o'"
      >
        购物车
      </van-tabbar-item>
      <van-tabbar-item
        name="member" 
        to="/member"
        :icon="active=='member'?'manager':'user-o'"
      >
        会员中心
      </van-tabbar-item>
    </van-tabbar>
  </div>
</template>

<script>

export default {
  name: 'index',
  components: {
  },
  data() {
    return {
      active: 'home'
    }
  },
  watch: {
    active() {
      console.log(this.active)
    },
    '$route'(to) {
      this.setActive(to)
    }
  },
  mounted() {
    this.setActive(this.$route)
  },
  methods: {
    setActive(route) {
      let routeName=route.name;
      if(routeName && routeName.indexOf('index-')===0){
        let tab = routeName.replace('index-','');
        if(this.active != tab){
          this.active = tab
        }
      }
    }
  }
};
</script>
<style lang="scss">
.router-box{
  .page{
    height: calc(100vh - 50px);
    position: relative;
    overflow: auto;
  }
}
</style>