<template>
  <div class="page page-404">
    <van-nav-bar title="页面未找到" left-text="返回" left-arrow @click-left="onClickLeft">
      <van-icon name="wap-home-o" size="20" slot="right" @click="goHome" />
    </van-nav-bar>
    <div class="empty-box">
      <van-icon name="warning-o" size="50" />
      <p>页面未找到</p>
        <div style="margin-top:80px" class="text-center">
      <van-button type="info" plain @click="goHome">返回首页</van-button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  methods: {
    onClickLeft() {
      this.$router.back();
    },
    goHome() {
        this.$router.push('/')
    }
  }
};
</script>
