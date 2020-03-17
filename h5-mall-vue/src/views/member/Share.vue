<template>
  <div class="page share-page">
    <van-nav-bar title="分享" left-text="返回" left-arrow @click-left="onClickLeft" />
    <div class="share-title">
      <h1>挖宝拼团</h1>
    </div>
    <div class="share-block">
      <div class="share-inner share-border-bottom">
      <h3>您的分享码</h3>
      <div class="share-code">{{member.agentcode}}</div>
      <van-button type="primary" size="small" @click="copyCode">复制邀请码</van-button>
      <div class="share-dot dot-left"></div>
      <div class="share-dot dot-right"></div>
      </div>
      <div class="share-inner">
        <van-image :src="shareimg" ></van-image>
        <div class="text">长按保存图片后可分享</div>
      </div>
    </div>
    <div class="subtitle">
      千万匠人共同打造源头品质商城
    </div>
  </div>
</template>
<script >
export default {
  data() {
    return {
      shareimg:''
    };
  },
  computed: {
    member() {
      return this.$store.state.userinfo;
    }
  },
  mounted() {
    if(!this.member || !this.member.id){
      this.$store.dispatch("updateUserinfo");
    }
  },
  methods: {
    onClickLeft() {
      this.$router.back();
    },
    copyCode() {

    }
  }
};
</script>

<style lang="scss">
.share-page {
  background: url(/static/share/background.png) center center no-repeat;
  background-size: cover;
  .share-title {
    padding-top: 50px;
  }
  h1 {
    text-indent: -99em;
    width: 250px;
    height: 50px;
    background: url(/static/share/title_treasure.png) center center no-repeat;
    background-size: contain;
    margin: 0 auto 20px auto;
  }
  .subtitle{
    text-indent: -99em;
    width: 300px;
    height: 30px;
    background: url(/static/share/title_subtitle.png) center center no-repeat;
    background-size: contain;
    margin: 10px auto 20px auto;
  }
  .share-block{
    border-radius: 10px;
    background:#fff;
    text-align: center;
    overflow: hidden;
    position: relative;
    margin:0 40px;
    .share-inner {
      padding:20px;
      position: relative;
    }
    h3{font-size:14px;color:#b9956b}
    .share-code{
      font-size:28px;
      margin-bottom:20px;
      color:#b08859;
    }
    .share-border-bottom{
      border-bottom:1px #af8755 dashed;
    }
    .share-dot{
      position: absolute;
      bottom:-10px;
      width:20px;
      height:20px;
      border-radius: 20px;
      background:#ccb47d;
    }
    .dot-left{
      left:-10px;
    }
    .dot-right{
      right:-10px;
      background-color:#b89564;
    }
    .van-image{
      width:200px;
      height:200px;
      border-radius:5px;
      overflow: hidden;
      box-shadow: 0 0 10px rgba(0,0,0,.2)
    }
    .text{
      color:#b59064;
      margin-top:10px;
    }
  }

}
</style>