<template>
  <div class="page cashlog-page">
    <van-nav-bar title="提现记录" left-text="返回" left-arrow @click-left="onClickLeft" />
    <van-list v-model="loading" :error="error" :finished="finished" finished-text="没有更多了" @load="loadNext">
      <van-cell v-for="item in lists" :key="item.id" :label="formatDate(item.create_time)" :value="formatMoney(item.amount)">
        <div slot="title">
          <span v-if="item.cashtype == 'wechat'">微信零钱</span>
          <span v-else-if="item.cashtype == 'alipay'">支付宝账户<br />{{maskinfo(item.card_name)}}</span>
          <span v-else-if="item.cashtype == 'unioncard'">银行卡<br />{{item.bank}}{{maskinfo(item.cardno)}}</span>
          <span v-else>{{item.cashtype}}</span>
        </div>
        <div>
          <div class="amount-val">{{formatMoney(item.amount)}}</div>
          <div v-if="item.cash_fee>0">手续费:{{formatMoney(-item.cash_fee)}}</div>
        <div v-if="item.status > 0" class="success">提现成功</div>
        <div v-else-if="item.status < 0" class="fail">{{item.reason?item.reason:'提现失败'}}</div>
        <div v-else class="warning"> 待审核</div>
        </div>
      </van-cell>
    </van-list>
  </div>
</template>
<script >
import utils from '../../utils'

export default {
  data() {
    return {
      error: false,
      loading: true,
      finished: false,
      page: 0,
      lists: []
    };
  },
  mounted() {
    this.loadData();
  },
  methods: {
    onClickLeft() {
      this.$router.back();
    },
    maskinfo(val) {
      return utils.maskString(val, Math.round(val.length * 0.4))
    },
    formatDate(timestamp) {
      return utils.dateFormat('Y-m-d H:i:s',timestamp)
    },
    formatMoney(money) {
      if(this.type =='credit'){
        return (money>0?'+':'')+ Math.round(money * 0.01)
      }
      return (money>0?'+':'')+ (money*0.01).toFixed(2)
    },
    loadData() {
      this.loading = true;
      this.error = false
      this.$api
        .post("member.account/cash_list", {
          page: this.page,
          field: this.type
        })
        .then(json => {
          this.loading = false;
          if(json.code==1){
            this.lists = this.lists.concat(json.data.cashes);
            if (!json.data.cashes ||
             json.data.cashes.length<=0 ||
             json.data.page >= json.data.total_page) {
              this.finished = true;
            }
          }else{
            this.error = true
          }
        }).catch(err=>{
          console.log(err)
          this.loading = false;
          this.error = true
        });
    },
    loadNext() {
      if(!this.error){
        this.page++;
      }
      this.loadData();
    },
    reload() {
      this.lists=[];
      this.page = 1;
      this.loadData();
    }
  }
};
</script>
<style lang="scss">
.cashlog-page{
  .amount-val{
    font-size:16px;
    color:#333;
    font-weight: bold;
  }
  .success{
    color:#090;
  }
  .fail{
    color:#900;
  }
  .warning{
    color:#a60;
  }
}
</style>