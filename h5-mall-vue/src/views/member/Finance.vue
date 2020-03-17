<template>
  <div class="page confirm-page">
    <van-nav-bar title="余额明细" left-text="返回" left-arrow @click-left="onClickLeft" />
    
  </div>
</template>
<script >
export default {
  data() {
    return {
    };
  },
  methods: {
    onClickLeft() {
      this.$router.back();
    }
  }
};
</script>