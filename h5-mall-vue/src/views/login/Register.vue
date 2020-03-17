<template>
  <div class="page page-login">
    <van-nav-bar title="注册" left-text="返回" left-arrow @click-left="onClickLeft" />
    <div class="container">
      <div></div>
    <div class="loggin-box">
      <h2>注册</h2>
      <van-cell-group>
        <van-field v-model="username" placeholder="用户名" left-icon="contact" />
        <van-field type="password" v-model="password" placeholder="密码" left-icon="warn-o" />
        <van-field type="password" v-model="repassword" placeholder="确认密码" left-icon="warn-o" />

        <van-field v-model="mobile" left-icon="phone-o" placeholder="请输入手机号" />
        <van-field
          v-model="verifycode"
          center
          clearable
          left-icon="certificate"
          placeholder="请输入短信验证码"
        >
          <van-button
            slot="button"
            size="small"
            :disabled="iscounting > 0"
            type="primary"
            @click="openSMS"
          >
            发送验证码
            <span v-if="iscounting>0">({{iscounting}})</span>
          </van-button>
        </van-field>
      </van-cell-group>
      <van-row class="btn-box" type="flex" justify="center">
        <van-col span="18">
          <van-button type="primary" :loading="isLoading" size="large" @click="doRegister">注册</van-button>
        </van-col>
      </van-row>
    </div>
    <van-row class="login-links">
      <van-col span="8" class="text-left">
        <router-link to="/login">返回登录</router-link>
      </van-col>
      <van-col span="8"></van-col>
      <van-col span="8" class="text-right"></van-col>
    </van-row>
    
    </div>
    <van-popup v-model="openSMSPopup" position="bottom">
      <div class="padding-tb-40">
        <van-cell-group>
          <van-field
            class="verify-field"
            v-model="captcha"
            placeholder="验证码"
            type="text"
            clearable
            left-icon="certificate"
          >
            <van-image
              slot="right-icon"
              class="verifycode"
              @click="getVerifyImage"
              :src="verifyimg"
            />
          </van-field>
        </van-cell-group>
        <div class="submit-btn">
          <van-button type="info" :disabled="iscounting>0" @click="sendSMS">
            发送验证码
            <span v-if="iscounting>0">({{iscounting}})</span>
          </van-button>
        </div>
      </div>
    </van-popup>
  </div>
</template>
<script >
import api from "../../api";
import config from "../../config";

let interval = 0;
export default {
  data() {
    return {
      username: "",
      password: "",
      repassword: "",
      verifycode: "",
      verifyimg: "/static/",
      smsCode: "",
      mobile: "",
      captcha: "",
      iscounting: 0,
      isLoading: false,
      needMobile: false,
      openSMSPopup: false
    };
  },
  mounted() {
    interval = setInterval(() => {
      if (this.iscounting > 0) {
        this.iscounting -= 1;
      }
    }, 1000);
  },
  destroyed() {
    clearInterval(interval);
  },
  methods: {
    onClickLeft() {
      this.$router.back();
    },
    doRegister() {
      if (!this.username) {
        this.$toast.fail("请填写用户名");
        return;
      }
      if (!this.password) {
        this.$toast.fail("请填写登录密码");
        return;
      }
      if (this.password != this.repassword) {
        this.$toast.fail("两次密码填写不一致");
        return;
      }
      if (this.needVerify && !this.verifycode) {
        this.$toast.fail("请填写验证码");
        return;
      }
      this.isLoading = true;
      api.checkAccessToken().then(() => {
        api
          .post("auth/register", {
            username: this.username,
            mobile: this.mobile,
            password: this.password,
            repassword: this.repassword,
            openid: api.openid,
            mobilecheck: this.verifycode
          })
          .then(json => {
            this.isLoading = false;
            console.log("result:", json);
            if (json.data.token) {
              api.setLogin({
                token: json.data.token,
                refresh_token: json.data.refresh_token,
                token_expire: json.data.expire_in
              });

              this.$toast.success("注册成功");
              this.goBack();
            } else {
              this.$toast.success("注册成功,请登录");
              this.$router.replace("/login");
            }
          })
          .catch(error => {
            this.isLoading = false;
            console.log("error:", error);
            if (error.code == 143) {
              this.$api.checkAccessToken(true).then(() => {
                this.$toast.fail("验证码过期,请重试");
                this.getVerifyImage();
              });
            } else {
              this.$toast.fail(error.msg || "注册失败");
              this.getVerifyImage();
            }
          });
      });
    },
    goBack() {
      let from = this.$store.state.rememberUrl;
      if (!from) {
        from = "/member";
      } else {
        this.$store.commit("setRememberUrl", "");
      }
      this.$router.replace(from);
    },
    getVerifyImage(force = false) {
      api.checkAccessToken(force).then(access_token => {
        this.verifyimg =
          config.server +
          "auth/captcha?access_token=" +
          access_token +
          "&_t=" +
          new Date().getTime();
          this.captcha=''
      });
    },
    openSMS() {
      if (!this.mobile) {
        this.$toast.fail("请填写手机号码");
        return;
      }
      if (!this.mobile.match(/^1[3-9]\d{9}$/)) {
        this.$toast.fail("手机号码格式错误");
        return;
      }
      this.getVerifyImage();
      this.openSMSPopup = true;
    },
    sendSMS() {
      if (!this.captcha) {
        this.$toast.fail("请填写图形验证码");
        return;
      }
      this.$api
        .post("auth/smscode", { mobile: this.mobile,type:'register', captcha: this.captcha })
        .then(result => {
          this.$toast.success(result.msg || "发送成功");
          this.iscounting = 60;
          this.openSMSPopup = false;
        })
        .catch(err => {
          if (err && err.code == 143) {
            this.$toast.fail("验证码已过期");
            this.getVerifyImage(true);
          } else {
            this.$toast.fail(err.msg || "发送失败");
          }
        });
    }
  }
};
</script>
<style lang="scss">
.verify-field {
  .van-image {
    display: block;
  }
}
.loggin-box {
  margin-top: 20px;
}
</style>