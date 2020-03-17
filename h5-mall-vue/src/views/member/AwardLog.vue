<template>
  <div class="page awardlog-page">
    <van-nav-bar title="奖励明细" left-text="返回" left-arrow @click-left="onClickLeft" right-text="提现" @click-right="$router.push('/member/cash')" />
    <van-list v-model="loading" :error="error" :finished="finished" finished-text="没有更多了" @load="loadNext">
      <van-cell v-for="item in lists" :key="item.id" :title="item.remark" :label="formatDate(item.create_time)" :value="formatMoney(item.amount)">
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
      page: 0,
      lists: []
    };
  },
  mounted() {
    this.loadData()
  },
  methods: {
    onClickLeft() {
      this.$router.back();
    },
    loadData() {
      this.loading = true;
      this.error = false
      this.$api
        .post("member.agent/award_log", {
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
          this.finished = true;
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
.awardlog-page{
  .grow-amount{
    color:#090
  }
  .dec-amount{
    color:#900
  }
}
</style>