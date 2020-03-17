<template>
  <div class="page member">
    <div class="user-poster" >
      <van-row class="user-info">
        <van-col offset="2">
          <van-image class="user-avatar" round width="4rem" height="4rem" :src="member.avatar" />
        </van-col>
        <van-col span="12" class="user-info-text">
          <div class="user-nickname">
            <span>{{member.nickname || member.username}}</span>
            <van-tag
              v-if="member.is_agent > 0"
              class="margin-left"
              type="primary"
            >{{member.agent.name}}</van-tag>
          </div>
          <template v-if="isLogin">
            <div v-if="openShare" class="user-acode">邀请码: {{member.agentcode}}</div>
            <div class="user-mobile">手机号: {{member.mobile}}</div>
          </template>
          <div v-else class="logintip" @click="goLogin">点击登录/注册</div>
        </van-col>
      </van-row>
      <van-icon size="24" class="right-icon" name="setting-o" @click="goProfile" />
    </div>
    <div class="points-box">
      <van-grid :columnNum="3" size="16px">
        <van-grid-item icon="chart-trending-o" to="/member/award_log">
          <div class="balance-text" slot="text">
            <div class="balance-name">我的收益</div>
            <div class="balance-value">{{formatMoney(member.total_reward )}}</div>
          </div>
        </van-grid-item>
        <van-grid-item icon="diamond-o" @click="toMoneyLog('credit')">
          <div class="balance-text" slot="text">
            <div class="balance-name">我的积分</div>
            <div class="balance-value">{{formatMoney(member.credit,0)}}</div>
          </div>
        </van-grid-item>
        <van-grid-item icon="balance-o" @click="toMoneyLog('reward')">
          <div class="balance-text" slot="text">
            <div class="balance-name">我的佣金</div>
            <div class="balance-value">{{formatMoney(member.reward)}}</div>
          </div>
        </van-grid-item>
      </van-grid>
    </div>
    <div class="cblock user-links">
      <van-cell icon="records" title="我的订单" value="全部订单" is-link to="/member/order" />
      <van-row>
        <van-col span="6">
          <van-tag v-if="counts[0] > 0" round type="danger">{{counts[0]}}</van-tag>
          <router-link to="/member/order?status=0">
            <van-icon name="pending-payment" />待付款
          </router-link>
        </van-col>
        <van-col span="6">
          <van-tag v-if="counts[1] > 0" round type="danger">{{counts[1]}}</van-tag>
          <router-link to="/member/order?status=1">
            <van-icon name="records" />待发货
          </router-link>
        </van-col>
        <van-col span="6">
          <van-tag v-if="counts[2] > 0" round type="danger">{{counts[2]}}</van-tag>
          <router-link to="/member/order?status=2">
            <van-icon name="tosend" />待收货
          </router-link>
        </van-col>
        <van-col span="6">
          <router-link to="/member/order?status=4">
            <van-icon name="logistics" />已完成
          </router-link>
        </van-col>
      </van-row>
    </div>
    <div class="cblock margin-top">
      <van-cell-group>
        <van-cell icon="gift-card-o" to="/member/credit_order" title="积分订单" is-link>
          <slot>
            <van-tag v-if="groupOrder > 0" round type="danger">{{creditOrder}}</van-tag>
          </slot>
        </van-cell>
        <van-cell v-if="openShare" icon="more-o" to="/member/share" title="我要分享" is-link />
        <van-cell v-if="openShare" icon="cluster-o" to="/member/team" title="我的团队" is-link />
      </van-cell-group>
    </div>
    <div class="cblock margin-top">
      <van-cell-group>
        <van-cell icon="gold-coin-o" @click="sorry" title="我的优惠券" is-link />
        <van-cell icon="location-o" to="/member/address" title="我的收货地址" is-link />
        <van-cell icon="info-o" to="/about/index" title="关于我们" is-link />
        <van-cell icon="share" @click="quit" title="退出登录" is-link />
      </van-cell-group>
    </div>
    <div class="margin-top"></div>
  </div>
</template>
<script>
import store from "../../store";
import api from "../../api";

let subscribed=null
export default {
  data() {
    return {
      groupOrder: 0,
      creditOrder:0,
      counts: []
    };
  },
  computed: {
    member() {
      return store.state.userinfo;
    },
    isLogin() {
      return store.state.isLogin;
    },
    openShare() {
      return store.state.config && store.state.config.open_share == 1;
    }
  },
  mounted() {
    this.loadData();
  },
  beforeDestroy() {
    if(subscribed){
      subscribed()
      subscribed=null;
    }
  },
  methods: {
    loadData() {
      store.dispatch("updateUserinfo");
      if(store.state.isLogin){
        this.loadCount()
      }else{
        subscribed = store.subscribe((mutation, state) => {
          if(mutation.type == 'isLogin'){
            if(state.isLogin){
              this.loadCount()
            }
          }
        })
      }
    },
    loadCount() {
      this.$api.get("member.credit_order/counts").then(json => {
        this.counts = json.data;
      });
    },
    formatMoney(money, power = 2) {
      if (!money) money = 0;
      return (money / 100).toFixed(power);
    },
    goProfile() {
      this.$router.push("/member/profile");
    },
    goLogin() {
      this.$router.push("/login");
    },
    toMoneyLog(type) {
      this.$router.push('/member/credit?type='+type);
    },
    quit() {
      if (!store.state.isLogin) {
        return this.$toast.fail("您还未登录");
      }
      this.$dialog.confirm({
        title: "提示",
        message: "确定退出登录?",
        beforeClose: this.beforeClose
      });
    },
    beforeClose(action, done) {
      if (action === "confirm") {
        api.get("member/quit").then(json => {
          if (json.code == 1) {
            api.clear();
            this.groupOrder=0;
            this.counts=[]
            this.$toast.success(json.msg);
          } else {
            this.$toast.fail(json.msg);
          }
          done();
        });
      } else {
        done();
      }
    },
    sorry() {
      this.$toast('功能暂未上线~')
    }
  }
};
</script>

<style lang="scss">
.user {
  &-poster {
    width: 100%;
    height: 220px;
    background: #099 center top no-repeat;
    background-size: cover;
    text-align: center;
    position: relative;
    .right-icon{
      position: absolute;
      right:20px;
      top:20px;
      color: #fff;
      text-shadow: 1px 1px 5px rgba(0,0,0,.1)
    }
  }
  &-info {
    padding-top: 4rem;
  }
  &-avatar {
    align-items: center;
    margin-right:10px;
  }
  &-info-text {
    text-align: left;
    color: #fff;
    font-size: 14px;
  }
  &-nickname {
    font-size: 18px;
  }

  &-group {
    margin-top: 15px;
  }

  &-links {
    margin-top: 15px;
    text-align: left;
    background-color: #fff;
    a {
      color: #444;
    }
    .van-row {
      padding: 15px 0;
      font-size: 12px;
      text-align: center;
      .van-col{
        position: relative;
      }
      .van-tag{
        position: absolute;
        left:60%;
        top:-5px;
      }
      .van-icon {
        display: block;
        font-size: 24px;
        color: #af8755;
      }
    }
  }
}
.points-box {
  height: 70px;
  margin: 0 10px;
  text-align: center;
  .van-grid {
    border-radius: 5px;
    margin-top: -35px;
    height: 70px;
    overflow: hidden;
    .van-grid-item__content {
      padding: 4px;
    }
    .balance-text {
      margin-top: 0;
      font-size: 10px;
      .balance-name {
        color: #666;
      }
      .balance-value {
        font-size: 12px;
        font-weight: bold;
        margin-top: 4px;
        color: #b00;
      }
    }
  }
}
</style>