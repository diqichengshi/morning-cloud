<template>
  <div class="page about">
    <van-nav-bar title="订单详情" left-text="返回" left-arrow @click-left="onClickLeft" />
    <div class="container">
      <div class="cblock order-status">
        <div v-if="order.status == 0" class="float-right">
          <van-count-down :time="countTime" />
        </div>
        <van-tag v-if="order.status == 0" type="warning">订单待支付</van-tag>
        <van-tag v-else-if="order.status == 1" type="info">已支付</van-tag>
        <van-tag v-else-if="order.status == 2" type="primary">已发货</van-tag>
        <van-tag v-else-if="order.status == 3" type="primary">已收货</van-tag>
        <van-tag v-else-if="order.status > 3" type="success">已完成</van-tag>
        <van-tag v-else-if="order.status == -1">已失效</van-tag>
        <van-tag v-else-if="order.status == -2">已退货/退款</van-tag>
        <van-tag v-else-if="order.status < -2" type="warning">售后中</van-tag>
      </div>

      <div class="cblock order-goods">
        <div class="goods-list">
          <div v-for="item in order.goods" :key="item.id">
            <van-card
              :num="item.count"
              :price="item.goods_price"
              :desc="item.vice_title"
              :title="item.goods_title"
              :thumb="item.goods_image"
              @click="viewGoods(item.goods_id)"
            />
          </div>
        </div>
        <van-cell title="总价" :value="order.payamount"></van-cell>
        <div class="actions">
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
      </div>
      <div class="cblock order-info">
        <van-cell title="订单号" :value="order.order_no">
          <van-button
            slot="right-icon"
            v-clipboard:copy="order.order_no"
            type="info"
            plain
            size="mini"
            style="margin-left:10px;"
            v-clipboard:success="onCopy"
            v-clipboard:error="onError"
          >复制</van-button>
        </van-cell>
        <van-cell title="下单时间" :value="formatDate(order.create_time)"></van-cell>
        <van-cell title="支付时间" :value="formatDate(order.pay_time)"></van-cell>
        <van-cell title="收货时间" :value="formatDate(order.confirm_time)"></van-cell>
      </div>
    </div>
  </div>
</template>
<script >
import Vue from "vue";
import VueClipboard from "vue-clipboard2";
import utils from "../../utils";

Vue.use(VueClipboard);

export default {
  data() {
    return {
      order_id: 0,
      countTime: 0,
      order: {}
    };
  },
  mounted() {
    let order_id = this.$route.query.id;
    if (order_id && !isNaN(order_id)) {
      this.order_id = order_id * 1;
    } else {
      this.$toast.fail("参数错误");
      this.$router.back();
    }
    this.getData();
  },
  methods: {
    onClickLeft() {
      this.$router.back();
    },
    viewGoods(goods_id) {
      this.$router.push("/product/detail/" + goods_id);
    },
    formatDate(timestamp) {
      if (!timestamp || timestamp == 0) return "-";
      return utils.dateFormat("Y-m-d H:i:s", timestamp);
    },
    getData() {
      this.$api
        .post("member.order/view", { id: this.order_id })
        .then(json => {
          if (json.code == 1) {
            this.order = utils.fixListImage(json.data, "goods.goods_image");
            let time =
              (this.order.create_time + this.config.groupbuy_overtime * 60) * 1000 -
              new Date().getTime();
            this.countTime = time <= 0 ? 6000 : time;
          }
        })
        .catch(err => {
          this.$toast.fail(err.msg || "参数错误");
          this.$router.back();
        });
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
            this.getData();
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
    },
    onCopy: function() {
      this.$toast.success("复制成功");
    },
    onError: function() {
      this.$toast.fail("复制失败, 请手动选择复制");
    }
  }
};
</script>

<style lang="scss">
.order-detail-page {
  .cblock {
    margin-top: 20px;
    .goods-list {
      padding: 10px;
    }
  }
  .order-status {
    padding: 10px;
  }
  .actions {
    padding: 10px;
    text-align: right;
    .van-button {
      margin-left: 10px;
    }
  }
}
</style>