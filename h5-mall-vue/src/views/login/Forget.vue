<template>
  <div class="page page-login">
    <van-nav-bar title="忘记密码" left-text="返回" left-arrow @click-left="onClickLeft" />
    <div class="loggin-box">
      <h2>忘记密码</h2>
      <van-steps :active="active">
        <van-step>找回方式</van-step>
        <van-step>获取验证码</van-step>
        <van-step>重置密码</van-step>
      </van-steps>

      <div v-if="active == 0">
        <van-tabs v-model="accountType" animated color="#09f">
          <van-tab title="手机号码找回">
            <van-cell-group>
              <van-field v-model="mobile" placeholder="请填写绑定的手机号码" left-icon="phone-o" />
            </van-cell-group>
          </van-tab>
          <van-tab title="邮箱找回">
            <van-cell-group>
              <van-field v-model="email" placeholder="请填写绑定的邮箱地址" left-icon="envelop-o" />
            </van-cell-group>
          </van-tab>
        </van-tabs>
        <van-cell-group>
          <van-field
            v-show="needVerify"
            class="verify-field"
            size="large"
            v-model="captcha"
            placeholder="验证码"
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

        <van-row class="btn-box" type="flex" justify="center">
          <van-col span="18">
            <van-button
              type="primary"
              size="large"
              :disabled="countDown > 0"
              @click="checkAccount"
            >下一步</van-button>
          </van-col>
        </van-row>
      </div>
      <div v-if="active == 1">
        <van-cell-group>
          <van-field v-model="verifycode" placeholder="请填写验证码" left-icon="certificate" />
        </van-cell-group>

        <van-row class="btn-box" type="flex" justify="center">
          <van-col span="18">
            <van-button type="primary" size="large" @click="checkCode">下一步</van-button>
          </van-col>
        </van-row>
      </div>

      <div v-if="active == 2">
        <van-cell-group>
          <van-field
            v-model="password"
            type="password"
            placeholder="请填写新密码"
            clearable
            left-icon="warn-o"
          />
          <van-field
            v-model="repassword"
            type="password"
            placeholder="请确认新密码"
            clearable
            left-icon="certificate"
          />
        </van-cell-group>

        <van-row class="btn-box" type="flex" justify="center">
          <van-col span="18">
            <van-button type="primary" size="large" @click="setPassword">确认修改</van-button>
          </van-col>
        </van-row>
      </div>
    </div>
    <van-row class="login-links">
      <van-col span="8" class="text-left">
        <router-link to="/login">返回登录</router-link>
      </van-col>
      <van-col span="8"></van-col>
      <van-col span="8" class="text-right"></van-col>
    </van-row>
  </div>
</template>
<script >
import config from "../../config";

let interval = 0;
export default {
  data() {
    return {
      username: "",
      mobile: "",
      email: "",
      password: "",
      repassword: "",
      verifycode: "",
      accountType: 0,
      active: 0,
      countDown: 0,
      needVerify: true,
      captcha: "",
      verifyimg: "/static/images/blank.gif"
    };
  },
  mounted() {
    if (this.needVerify) this.getVerifyImage();
    setInterval(() => {
      if (this.countDown > 0) {
        this.countDown -= 1;
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
    getVerifyImage(force=false) {
      this.$api.checkAccessToken(force).then(access_token => {
        this.verifyimg =
          config.server +
          "auth/captcha?access_token=" +
          access_token +
          "&_t=" +
          new Date().getTime();
          this.captcha=''
      });
    },
    checkAccount() {
      let data = { captcha: this.captcha };
      if (!this.captcha) {
        this.$toast.fail("请填写图形验证码");
        return;
      }
      if (this.accountType == 0) {
        if (!this.mobile) {
          this.$toast.fail("请填写手机号码");
          return;
        }
        if (!this.mobile.match(config.mobileRegexp)) {
          this.$toast.fail("手机号码格式错误");
          return;
        }
        data.account = this.mobile;
        data.type = "mobile";
      } else if (this.accountType == 1) {
        if (!this.email) {
          this.$toast.fail("请填写手机号码");
          return;
        }
        if (!this.email.match(config.emailRegexp)) {
          this.$toast.fail("邮箱格式错误");
          return;
        }
        data.account = this.email;
        data.type = "email";
      } else {
        this.$toast("验证类型错误");
        return;
      }
      this.$api
        .post("auth/forget", data)
        .then(result => {
          this.$toast.success(result.msg || "验证码已发送");
          this.active = 1;
          this.countDown = 60;
        })
        .catch(err => {
          if (err.code == 143) {
              this.$toast.fail("验证码过期,请重试");
              this.getVerifyImage(true);
          } else {
            this.$toast.fail(err.msg || "验证失败");
            this.getVerifyImage();
          }
        });
    },
    checkCode() {
      if (!this.verifycode) {
        this.$toast.fail("请填写验证码");
        return;
      }
      this.$api
        .post("auth/forget", {
          verify: this.verifycode,
          step: 1
        })
        .then(result => {
          this.$toast.success(result.msg || "验证通过");
          this.active = 2;
        })
        .catch(err => {
          this.$toast.fail(err.msg || "验证失败");
          if (err.code != 161) {
            this.step = 0;
          }
        });
    },
    setPassword() {
      if (!this.password) {
        this.$toast.fail("请填写新密码");
        return;
      }
      if (!this.repassword) {
        this.$toast.fail("请再次确认新密码");
        return;
      }
      if (this.password != this.repassword) {
        this.$toast.fail("两次输入密码不一致");
        return;
      }
      this.$api
        .post("auth/forget", {
          password: this.password,
          repassword: this.repassword,
          step: 2
        })
        .then(result => {
          this.$toast.success(result.msg || "密码重置成功");
          this.$router.back();
        })
        .catch(err => {
          this.$toast.fail(err.msg || "重置失败");
          if (err.code != 162) {
            this.step = 0;
          }
        });
    }
  }
};
</script>
<style lang="scss">
.van-steps {
  text-align: left;
}
.van-tabs {
  margin-top: 10px;
  .van-tabs__content {
    padding: 10px 0;
  }
}
.verify-field {
  .van-image {
    display: block;
  }
}
.loggin-box {
  margin-top: 20px;
}
</style>