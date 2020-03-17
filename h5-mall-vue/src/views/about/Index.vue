<template>
  <div class="page about">
    <van-nav-bar title="关于" left-text="返回" left-arrow @click-left="onClickLeft" />

    <div class="container">
      <van-swipe v-if="images && images.length>0" :autoplay="3000" indicator-color="white">
        <van-swipe-item v-for="img in images" :key="img.id">
          <van-image :src="image.image" fit="cover" />
        </van-swipe-item>
      </van-swipe>
      <div v-html="content.content"></div>
    </div>
  </div>
</template>
<script >
import utils from "../../utils";

export default {
  data() {
    return {
      images: [],
      content: {}
    };
  },
  mounted() {
    this.loadData();
  },
  methods: {
    onClickLeft() {
      this.$router.back();
    },
    loadData() {
      this.$api
        .post("page/page", { name: "profile" })
        .then(json => {
          if (json.data.images) {
            this.images = utils.fixListImage(json.data.images);
          }
          json.data.page.content = utils.parseHtml(json.data.page.content);
          this.content = json.data.page;

          let options={
              title: this.content.title,
            }
            if(this.images && this.images.length>0){
              options.imgUrl = this.images[0].image
            }
          this.$api.wxShare(options)
        })
        .catch(() => {
          this.content = {
            content: '<div class="empty-box">资料更新中...</div>'
          };
        });
    }
  }
};
</script>