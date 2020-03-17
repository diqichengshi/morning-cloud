<template>
  <div class="page about">
    <van-nav-bar title="详情" left-text="返回" left-arrow @click-left="onClickLeft" />
    <h1>This is an about page</h1>
  </div>
</template>
<script >
export default {
  data() {
    return {};
  },
  methods: {
    onClickLeft() {
      this.$router.back();
    }
  }
};
</script>