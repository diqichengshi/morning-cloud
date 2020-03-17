<template>
  <div class="page page-login" id="page-login">
    <van-nav-bar title="登录" left-text="返回" left-arrow @click-left="onClickLeft" />

    <div class="loggin-box">
      <h2>会员登录</h2>
      <van-cell-group>
        <van-field v-model="username" size="large" placeholder="用户名" left-icon="contact" />
        <van-field
          type="password"
          size="large"
          clearable
          v-model="password"
          placeholder="密码"
          left-icon="warn-o"
        />
        <van-field
          v-show="needVerify"
          class="verify-field"
          size="large"
          v-model="verifycode"
          placeholder="验证码"
          left-icon="certificate"
        >
          <van-image slot="right-icon" class="verifycode" @click="getVerifyImage" :src="verifyimg" />
        </van-field>
      </van-cell-group>
      <van-row class="btn-box" type="flex" justify="center">
        <van-col span="18">
          <van-button type="primary" :loading="isLoading" size="large" @click="doLogin">登录</van-button>
        </van-col>
      </van-row>
    </div>
    <van-row class="login-links">
      <van-col span="8" class="text-left"><router-link to="/login/forget">忘记密码</router-link></van-col>
      <van-col span="8"></van-col>
      <van-col span="8" class="text-right"><router-link to="/login/register">注册新用户</router-link></van-col>
    </van-row>

    <van-divider />

    <div class="third-login text-center">
      <van-image src="" round width="60"  height="60" ></van-image>
    </div>
  </div>
</template>
<script >
import api from "../../api";
import config from "../../config";

export default {
  data() {
    return {
      token: "",
      username: "",
      password: "",
      needVerify: false,
      verifycode: "",
      verifyimg: "/static/",
      isLoading: false
    };
  },
  mounted() {
    if (api.hasToken()) {
      this.$toast.success("已登录");
      this.goBack();
      return;
    }
    if (this.needVerify) this.getVerifyImage();
  },
  methods: {
    onClickLeft() {
      this.$router.back();
    },
    doLogin() {
      if (!this.username) {
        this.$toast.fail("请填写用户名");
        return;
      }
      if (!this.password) {
        this.$toast.fail("请填写登录密码");
        return;
      }
      if (this.needVerify && !this.verifycode) {
        this.$toast.fail("请填写验证码");
        return;
      }
      this.isLoading = true;
      api.checkAccessToken().then(() => {
        api
          .post("auth/login", {
            username: this.username,
            password: this.password,
            openid: api.openid,
            verify: this.verifycode
          })
          .then(json => {
            this.isLoading = false;
              api.setLogin({
                token: json.data.token,
                refresh_token: json.data.refresh_token,
                token_expire: json.data.expire_in
              });
              //console.log("result:", json);
              this.$toast.success("登录成功");
              this.goBack();
          })
          .catch(error => {
            this.isLoading = false;
            console.log("error:", error);
            if (error.code == 143) {
              this.$toast.fail("验证码过期,请重试");
              this.getVerifyImage(true);
          } else {
            this.$toast.fail(error.msg || "登录失败");
            this.checkNeedVerify(error);
          }
            
          });
      });
    },
    checkNeedVerify(json) {
      if (json.code == 104 || (json.data && json.data.need_verify)) {
        this.needVerify = true;
        this.getVerifyImage();
      }
    },
    goBack() {
      let from = this.$store.state.rememberUrl;
      if (!from) {
        from = "/member";
      }else{
        this.$store.commit('setRememberUrl','')
      }
      this.$router.replace(from);
    },
    getVerifyImage(force=false) {
      api.checkAccessToken(force).then(access_token => {
        this.verifyimg = config.server +
          "auth/captcha?access_token=" +
            access_token +
            "&_t=" +
            new Date().getTime();
            this.verifycode=''
      });
    }
  }
};
</script>
<style lang="scss">
.page-login {
  .loggin-box {
    margin: 20px;
    margin-top: 15%;
    padding: 30px 20px;
    border-radius: 10px;
    background: #fff;
    box-shadow: 1px 1px 20px rgba(0, 0, 0, 0.1);
    position: relative;
    text-align: center;
    .logo {
      position: relative;
      margin-top: -50%;
    }
    h1,h2{
      margin-top:0;
      margin-bottom:15px;
    }
    .van-hairline--top-bottom::after, .van-hairline-unset--top-bottom::after{
      border:0;
    }
    .verify-field {
      .van-cell__value {
        overflow: visible;
      }
    }
    .verifycode {
      position: absolute;
      right: 0;
      top: -8px;
    }
    .btn-box {
      margin-top: 30px;
    }
  }
  .login-links{
    margin:20px 30px;
    font-size:13px;
    a{
      color:#06b;
    }
  }
}
.verify-field {
  .van-image {
    display: block;
  }
}
</style>