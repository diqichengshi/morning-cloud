<template>
  <div class="page order-page">
    <van-nav-bar title="订单" left-text="返回" left-arrow @click-left="onClickLeft" />
    <van-tabs v-model="active" @change="changeStatus">
      <van-tab title="全部"></van-tab>
      <van-tab title="待付款"></van-tab>
      <van-tab title="待发货"></van-tab>
      <van-tab title="待收货"></van-tab>
    </van-tabs>
    <van-list
      v-model="loading"
      :error="error"
      :finished="finished"
      finished-text="没有更多了"
      @load="loadNext"
    >
      <van-panel
        v-for="order in orders"
        :key="order.order_id"
        :title="order.order_no"
        :status="orderStatus(order.status)"
        @click="viewOrder(order.order_id)"
      >
        <div>
          <van-card
            v-for="item in order.goods"
            :key="item.id"
            :num="1"
            :price="item.goods_price"
            desc
            :title="item.goods_title"
            :thumb="item.goods_image"
          >
            <div class="goods-price">
              {{item.goods_price}} + {{item.goods_credit}}
              <van-icon name="diamond-o" />
            </div>
          </van-card>
        </div>
        <div slot="footer" class="footer-action" @click.stop="empty">
          <template v-if="order.status==0">
            <van-button size="small" @click="cancelOrder(order.order_id)">取消</van-button>
            <van-button size="small" type="danger" @click="payOrder(order.order_id)">支付</van-button>
          </template>
          <template v-if="order.status > 1">
            <van-button size="small" @click="expressOrder(order.order_id)">查看物流</van-button>
          </template>
          <template v-if="order.status == 2">
            <van-button size="small" type="info" @click="completeOrder(order.order_id)">确认收货</van-button>
          </template>
          <template v-if="order.status < 0 && order.status > -3">
            <van-button size="small" @click="deleteOrder(order.order_id)">删除</van-button>
          </template>
        </div>
      </van-panel>
    </van-list>
  </div>
</template>
<script >
import utils from "../../utils";

export default {
  name: "member-order",
  data() {
    return {
      active: 0,
      error: false,
      loading: true,
      finished: false,
      page: 1,
      orders: []
    };
  },
  mounted() {
    let status = this.$route.query.status;
    if (status && !isNaN(status)) {
      this.active = status * 1 + 1;
    }
    this.loadOrder();
  },
  methods: {
    onClickLeft() {
      this.$router.back();
    },
    empty() {},
    orderStatus(status) {
      switch (status) {
        case 0:
          return "待付款";
        case 1:
          return "已付款";
        case 2:
          return "待收货";
        case 3:
          return "待评价";
        case 4:
          return "已完成";
        case -3:
          return "退款中";
        default:
          return "已失效";
      }
    },
    viewOrder(order_id) {
      this.$router.push("/member/order/detail?id=" + order_id);
    },
    loadOrder() {
      let status = this.active > 0 ? this.active - 1 : "";
      this.loading = true;
      this.error = false
      this.$api
        .post("member.order/index", {
          status: status,
          page: this.page
        })
        .then(json => {
          this.loading = false;
          if (json.code == 1) {
            if (json.data.lists) {
              this.orders = this.orders.concat(
                json.data.lists.map(item => {
                  item.goods = utils.fixListImage(item.goods, "goods_image");
                  return item;
                })
              );
            }
            if (
              !json.data.lists ||
              json.data.lists.length <= 0 ||
              json.data.page >= json.data.total_page
            ) {
              this.finished = true;
            }
          } else {
            this.error = true;
          }
        })
        .catch(err => {
          console.log(err);
          this.loading = false;
          this.error = true;
        });
    },
    loadNext() {
      if(!this.error){
        this.page++;
      }
      this.loadOrder();
    },
    changeStatus() {
      this.finished = false;
      this.orders = [];
      this.page = 1;
      this.loadOrder();
    },
    cancelOrder(order_id) {
      this.$dialog
        .confirm({
          title: "取消订单",
          message: "确定取消此订单?"
        })
        .then(() => {
          this.$api
            .post("member.order/cancel", { id: order_id })
            .then(json => {
              if (json.code == 1) {
                this.$toast.success(json.msg || "操作成功");
                this.changeStatus();
              }
            })
            .catch(err => {
              this.$toast.fail(err.msg || "操作失败");
            });
        });
    },
    deleteOrder(order_id) {
      this.$dialog
        .confirm({
          title: "删除订单",
          message: "确定删除此订单?"
        })
        .then(() => {
          this.$api
            .post("member.order/delete", { id: order_id })
            .then(json => {
              if (json.code == 1) {
                this.$toast.success(json.msg || "操作成功");
                this.changeStatus();
              }
            })
            .catch(err => {
              this.$toast.fail(err.msg || "操作失败");
            });
        });
    },
    payOrder(order_id) {
      this.$dialog
        .confirm({
          title: "支付订单",
          message: "使用微信支付该订单?"
        })
        .then(() => {
          this.$api.wxPay(order_id,'').then(()=>{
            this.changeStatus();
          }).catch(()=>{
            
          })
        });
    },
    expressOrder(order_id) {
      console.log(order_id);
      this.$toast("功能开发中~");
    },
    completeOrder(order_id) {
      this.$dialog
        .confirm({
          title: "完成订单",
          message: "确定已收货并完成订单?"
        })
        .then(() => {
          this.$api
            .post("member.order/confirm", { id: order_id })
            .then(json => {
              if (json.code == 1) {
                this.$toast.success(json.msg || "操作成功");
                this.changeStatus();
              }
            })
            .catch(err => {
              this.$toast.fail(err.msg || "操作失败");
            });
        });
    }
  }
};
</script>
<style lang="scss">
.order-page {
  .van-panel {
    margin-top: 20px;
  }
}
</style>