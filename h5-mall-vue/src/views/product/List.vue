<template>
  <div class="page product-index">
    <van-nav-bar title="商品列表" left-text="返回" left-arrow @click-left="onClickLeft" />
    <van-dropdown-menu>
      <van-dropdown-item v-model="value1" :options="option1" />
      <van-dropdown-item v-model="value2" :options="option2" />
    </van-dropdown-menu>
  </div>
</template>
<script >
export default {
  data() {
    return {
      isLoading: true,
      value1:"",
      value2:"",
      option1:[],
      option2:[]
    };
  },
  methods: {
    onClickLeft() {
      this.$router.back();
    }
  }
};
</script>