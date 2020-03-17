<template>
  <div class="page about">
    <van-nav-bar title="优惠券" left-text="返回" left-arrow @click-left="onClickLeft" />
    <van-list v-model="loading" :error="error" :finished="finished" finished-text="没有更多了" @load="loadNext">
      <van-cell v-for="item in lists" :key="item.order_id" :title="item.order_no" />
    </van-list>
  </div>
</template>
<script >
import api from "../../api";

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
  methods: {
    onClickLeft() {
      this.$router.back();
    },
    loadData() {
      this.loading = true;
      this.error = false
      api
        .post("member.order/index", {
          page: this.page
        })
        .then(json => {
          this.loading = false;
          if(json.code==1){
            this.lists.concat(json.data.lists);
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
    loadNext() {
      if(!this.error){
        this.page++;
      }
      this.loadData();
    }
  }
};
</script>