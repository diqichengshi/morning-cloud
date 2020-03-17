<template>
  <div class="page creditlog-page">
    <van-nav-bar :title="types[type]+'明细'" left-text="返回" :right-text="type=='reward'?'提现':'转赠'" left-arrow @click-left="onClickLeft" @click-right="onRightClick" />
    <van-list v-model="loading" :error="error" :finished="finished" finished-text="没有更多了" @load="loadNext">
      <van-cell v-for="item in lists" :key="item.id" :title="item.reson" :label="formatDate(item.create_time)" :value="formatMoney(item.amount)">
        <span :class="item.amount>0?'grow-amount':'dec-amount'">{{formatMoney(item.amount)}}</span>
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
      type:'money',
      types:{
        'money':'余额',
        'credit':'积分',
        'reward':'佣金'
      },
      page: 0,
      lists: []
    };
  },
  mounted() {
    let type = this.$route.query.type
    if(type && this.types[type]){
      this.type = type
    }
    this.loadData()
  },
  methods: {
    onClickLeft() {
      this.$router.back();
    },
    onRightClick() {
      if(this.type == 'reward'){
        this.$router.push('/member/cash');
      }else if(this.type == 'credit'){
        this.$router.push('/member/transfer');
      }
    },
    loadData() {
      this.loading = true;
      this.error = false
      this.$api
        .post("member.account/money_log", {
          page: this.page,
          field: this.type
        })
        .then(json => {
          this.loading = false;
          if(json.code==1){
            if(json.data.logs){
            this.lists = this.lists.concat(json.data.logs);
            }
            if (!json.data.lists ||
             json.data.lists.length<=0 ||
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
    formatDate(timestamp) {
      return utils.dateFormat('Y-m-d H:i:s',timestamp)
    },
    formatMoney(money) {
      if(this.type =='credit'){
        return (money>0?'+':'')+ Math.round(money * 0.01)
      }
      return (money>0?'+':'')+ (money*0.01).toFixed(2)
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
.creditlog-page{
  .grow-amount{
    color:#090
  }
  .dec-amount{
    color:#900
  }
}
</style>