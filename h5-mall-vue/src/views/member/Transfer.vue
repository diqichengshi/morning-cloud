<template>
  <div class="page transfer-page">
    <van-nav-bar title="积分转赠" left-text="返回" left-arrow @click-left="onClickLeft" />
    <van-cell-group class="margin-top">
      <van-field
        label="转赠用户"
        v-model="keyword"
        placeholder="输入用户名或手机号码匹配"
        right-icon="search"
        clearable
        @blur="doSearch"
        @click-right-icon="searchUser"
      ></van-field>

      <van-cell
        v-if="touser"
        class="transuser"
        :title="touser.username"
        :label="touser.nickname+'/'+touser.mobile"
        value
        is-link
      >
        <van-image
          v-if="touser"
          slot="right-icon"
          width="40"
          :src="touser.avatar?touser.avatar:'/static/avatar-default.png'"
        ></van-image>
      </van-cell>
    </van-cell-group>
    <div class="text-muted">转赠只支持ID, 用户名, 手机号精确匹配, 不支持昵称匹配</div>

    <van-cell-group class="margin-top">
      <van-cell title="当前余额" :value="Math.round(member.credit*0.01)"></van-cell>
      <van-field
        label="转赠金额"
        v-model="amount"
        :error="isNaN(amount ) || member.credit*0.01<amount"
        clearable
        input-align="right"
        placeholder="请输入要转赠的金额"
      ></van-field>
      <van-cell
        v-if="!isNaN(amount ) && amount > 0"
        title="转后余额"
        :value="Math.round(member.credit*0.01) - amount"
      ></van-cell>
    </van-cell-group>



    <div class="trans-btn">
      <van-button type="primary" size="large" @click="doTransfer">立即转赠</van-button>
    </div>
    <van-popup v-model="showKeyboard" closeable position="bottom" :style="{ height: '80%' }">
<div style="margin-top:50px;">
    <van-password-input
  v-model="secpassword"
  info="请输入安全密码"
  :focused="showKeyboard"
  @focus="showKeyboard = true"
/>
<van-number-keyboard
  :show="showKeyboard"
  @input="onInput"
  @delete="onDelete"
  @blur="showKeyboard = false"
/>
</div>
    </van-popup>
  </div>
</template>
<script >
export default {
  data() {
    return {
      show: false,
      amount: "",
      keyword: "",
      secpassword:"",
      showKeyboard:false,
      touser: null
    };
  },
  computed: {
    member() {
      return this.$store.state.userinfo;
    }
  },
  mounted() {
    if(!this.member.has_secpassword){
      this.$dialog.confirm({
        'message':'您还未设置安全密码, 是否现在去设置',
        beforeClose:(action,done)=>{
          if(action == 'confirm'){
            this.$router.push('/member/sec_password')
          }else{
            this.$router.back()
          }
          done()
        }
      })
    }
  },
  methods: {
    onClickLeft() {
      this.$router.back();
    },
    onInput(key) {
      this.secpassword = (this.secpassword + key).slice(0, 6);
      if(this.secpassword.length>=6){
        this.doSubmit()
      }
    },
    onDelete() {
      this.secpassword = this.secpassword.slice(0, this.secpassword.length - 1);
    },
    doTransfer() {
      if (!this.touser || !this.touser.id) {
        this.$toast.fail("请填写转赠人");
        return;
      }
      if (this.touser.id == this.member.id) {
        this.$toast.fail("不能转赠给自己");
        return;
      }
      if (isNaN(this.amount) || this.amount < 1) {
        this.$toast.fail("转赠数量错误");
        return;
      }
      if (this.amount > this.member.credit * 0.01) {
        this.$toast.fail("转赠额度不足");
        return;
      }
      this.showKeyboard = true;
    },
    doSubmit() {
      
      this.$toast.loading();
      this.$api
        .post("member.account/transfer", {
          action: "transout",
          field: "credit",
          member_id: this.touser.id,
          secpassword: this.secpassword,
          amount: this.amount
        })
        .then(result => {
          this.$toast.success(result.msg || "转赠成功");
          this.showKeyboard = false;
          this.$store.dispatch('updateUserinfo').then(()=>{
            this.$router.back();
          })
          
        })
        .catch(err => {
          this.$toast.fail(err.msg || "转赠失败");
          this.secpassword='';
          return;
        });
    },
    searchUser() {
      if (!this.keyword) {
        this.$toast.fail("请填写用户名或手机号码再点击匹配");
        return;
      }
      this.doSearch();
    },
    doSearch() {
      this.$api
        .post("member/search", { keyword: this.keyword })
        .then(res => {
          this.touser = res.data;
        })
        .catch(err => {
          this.$toast.fail(err.msg || "未匹配到用户");
          this.touser = null;
        });
    }
  }
};
</script>
<style lang="scss">
.transfer-page {
  .transuser {
    .van-image {
      margin-left: 10px;
    }
  }
  .trans-btn {
    margin: 10px 20px;
  }
}
</style>