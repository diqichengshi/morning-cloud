<template>
  <div class="page password-page">
    <van-nav-bar title="设置安全密码" left-text="返回" left-arrow @click-left="onClickLeft" />
    

    <van-cell-group class="margin-top">
      <van-field
        label="新密码"
        v-model="newpassword"
        :error="checkPassword"
        clearable
        input-align="right"
        type="password"
        placeholder="请输入要修改的密码"
      ></van-field>
      <van-field
        label="确认密码"
        v-model="repassword"
        :error="checkRePassword"
        clearable
        input-align="right"
        type="password"
        placeholder="请再次输入密码确认"
      ></van-field>
    </van-cell-group>
    <div class="text-muted">安全密码必须使用 <b>6</b> 位长度的<b>数字</b></div>

    <van-cell-group class="margin-top">
        <van-field
        :label="member.has_secpassword?'当前安全密码':'当前登录密码'"
        v-model="password"
        clearable
        input-align="right"
        type="password"
        placeholder="请输入现在使用的密码"
      ></van-field>
    </van-cell-group>

    <div class="submit-btn margin-top">
      <van-button type="primary" size="large" @click="doSubmit">保存修改</van-button>
    </div>
  </div>
</template>
<script >
export default {
  data() {
    return {
      password: "",
      newpassword: "",
      repassword: ""
    };
  },
  computed: {
    member() {
      return this.$store.state.userinfo;
    },
    checkPassword() {
        return this.newpassword!='' && (this.newpassword.length != 6 || !this.newpassword.match(/^\d+$/))
    },
    checkRePassword() {
        return !this.checkPassword && this.repassword != this.newpassword
    },
  },
  methods: {
    onClickLeft() {
      this.$router.back();
    },
    doSubmit() {
      if (!this.password) {
        this.$toast.fail("请输入当前密码");
        return;
      }
      if (!this.newpassword) {
        this.$toast.fail("请输入新密码");
        return;
      }
      if (this.newpassword.length != 6 || !this.newpassword.match(/^\d+$/)) {
        this.$toast.fail("请确认密码长度及字符");
        return;
      }
      if (this.newpassword != this.repassword) {
        this.$toast.fail("两次密码输入不一致");
        return;
      }

      this.$api
        .post("member/sec_password", {
          password: this.password,
          newpassword: this.newpassword
        })
        .then(result => {
          this.$toast.success(result.msg || "修改成功")
          this.$store.dispatch('updateUserinfo').then(()=>{
              this.$router.back()
          })
        })
        .catch(err => {
          this.$toast.fail(err.msg || "修改失败");
          return;
        });
    }
  }
};
</script>