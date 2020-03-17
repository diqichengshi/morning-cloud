<template>
  <div id="app">
    <transition name="fade">
      <v-splash v-show="!hideSplash"></v-splash>
    </transition>
    <router-view v-transition />
  </div>
</template>

<script>
import config from './config';
import store from './store';

export default {
  data() {
    return {
      isReady:false
    }
  },
  computed: {
    hideSplash() {
      console.log('ready:',this.isReady, store.state.firstLoaded)
      return (this.isReady || store.state.firstLoaded) && (!config.isWechat || store.state.wechatChecked)
    }
  },
  mounted() {
    setTimeout(()=>{
      this.homeReady()
    },3000)
  },
  methods: {
    homeReady() {
      console.log('homeReady')
      this.isReady = true;
    }
  }
}

</script>

<style lang="scss">
body{
  font-size:12px;
}
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  width: 100vw;
  height: 100vh;
  background: #f7f7f7;
  overflow: hidden;
  max-width: 750px;
  margin: 0 auto;
  position: relative;
}
#app > .page {
  background-color: #f7f7f7;
  width: 100%;
  height: 100vh;
  position: relative;
}
.container{
  height:calc(100vh - 46px);
  overflow-x: hidden;
  overflow-y: auto;
  &:after{
    content:"";
    display: block;
    height:30px;
  }
}
.pop-container{
  max-height:100vh;
  min-height:300px;
  overflow-x: hidden;
  overflow-y: auto;
  &:after{
    content:"";
    display: block;
    height:30px;
  }
  
}
.pop-html{
  display: flex;
  flex-direction: column;
  .van-nav-bar {
    flex:0 0 46px;
  }
  .html-content{
    flex:1;
    height:50%;
    overflow: hidden auto;
  }
}
a{
  color: #0099ff;
}
input,textarea{
  font-size:14px;
}

.text-left{
  text-align:left;
}
.text-right{
  text-align: right;
}
.text-center{
  text-align: center;
}
.float-right{
  float: right;
}

.van-goods-action{
  box-shadow: 1px 1px 5px rgba(0,0,0,.2);
}
.van-submit-bar .van-button{
  border-radius:0;
}
.van-goods-action .van-button{
  border-radius:0;
  &.van-goods-action-button--first{
    border-top-left-radius: 20px;
    border-bottom-left-radius: 20px;
  }
  &.van-goods-action-button--last{
    border-top-right-radius: 20px;
    border-bottom-right-radius: 20px;
  }
}

.empty-box{
  text-align: center;
  padding-top:40px;
  padding-bottom:40px;
  color:#999;
  .van-button{
    margin-top:10px;
  }
}
.margin-left{
  margin-left:10px !important;
}
.margin-top{
  margin-top:15px !important;
}
.margin-top10{
margin-top:10px !important;
}
.padding-tb-20{
  padding-top:20px;
  padding-bottom:20px;
}
.padding-tb-40{
  padding-top:40px;
  padding-bottom:40px;
}
.van-dialog{
  border-radius: 5px;
}
.cblock {
  margin: 0 10px;
  background: #fff;
  border-radius: 5px;
  overflow: hidden;
}

.mycard {
  background: #fff;
  .card-title {
    font-size: 14px;
    text-align: left;
    margin: 5px;
  }
}
.user-avatar{
  display:flex;
  flex-direction: row;
  align-items: center;
  .van-image{
    margin-right:10px;
  }
}

.van-cell{
  align-items: center;
  .avatar{
    float: right;
  }
}
.submit-btn{
  width:90%;
  margin:20px auto;
  text-align: center;
}
.footer-action{
  text-align: right;
  .van-button{
    margin-left:10px;
  }
}
.html-content{
  img{
    max-width:100%;
  }
}
.text-muted{
  color:#999;
  padding: 10px;
  font-size:13px;
}
</style>
