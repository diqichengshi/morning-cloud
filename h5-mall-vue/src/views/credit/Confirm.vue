<template>
  <div class="page confirm-page">
    <van-nav-bar title="确认订单" left-text="返回" left-arrow @click-left="onClickLeft" />

    <div></div>
    <van-cell
      class="address-item margin-top"
      size="large"
      icon="location-o"
      is-link
      @click="onSelect"
    >
      <div v-if="address && address.address_id > 0" class="has-address">
        <div class="address-name">{{address.recive_name}}, {{address.mobile}}</div>
        <div
          class="address-vice"
        >{{address.province}} {{address.city}} {{address.area}} {{address.address}}</div>
      </div>
      <div v-else class="no-address">请选择地址</div>
    </van-cell>

    <van-panel title="积分专区" class="margin-top">
      <van-card
        v-for="item in goods"
        :key="item.id"
        :desc="item.vice_title"
        :title="item.title"
        :thumb="item.image"
      >
        <div slot="num">
          <van-stepper v-model="item.count" @change="coculate" />
        </div>
        <div slot="price" class="price">
          {{item.release_price}} + {{item.credit}}
          <van-icon name="diamond-o" />
        </div>
      </van-card>
    </van-panel>

    <div class="margin-top">
      <van-cell title="积分抵扣" :label="'可用积分 : ' + Math.round(member.credit*0.01)">
        - {{total_credit}}
        <van-icon name="diamond-o" />
      </van-cell>
      <van-cell title="邮费" :value="express.fee>0?express.fee:'免费包邮'"></van-cell>
    </div>

    <van-submit-bar :price="total_price" button-text="提交订单" @submit="onSubmit" />

    <!-- 联系人列表 -->
    <van-popup v-model="showList" position="bottom">
      <div v-if="list">
        <address-list
          :lists="list"
          :selected-id="address?address.address_id:0"
          @pick="pickAddress"
        />
        <div class="text-center" style="padding:20px 0;">
          <van-button v-if="isWechat" plain type="primary" @click="importAddress">从微信导入地址</van-button>
          <van-button v-else plain type="primary" @click="manageAddress">管理地址</van-button>
          <van-button class="margin-left" type="info" plain @click="addAddress">添加地址</van-button>
        </div>
      </div>
      <div v-else class="empty-box">
        <van-loading size="24px">加载中...</van-loading>
        <div style="margin-top:50px;"></div>
      </div>
    </van-popup>
  </div>
</template>
<script >
import utils from "../../utils";
import config from "../../config";

export default {
  data() {
    return {
      goods_id: 0,
      goods: [],
      group_id: 0,
      address_id: 0,
      address: {},
      express: { title: "", fee: 0 },
      total_credit: 0,
      total_price: 0,

      showList: false,
      list: null,

      isWechat: config.isWechat && config.wxid
    };
  },
  computed: {
    credit_rate() {
      if (!this.$store.state.config) {
        return 1;
      }
      if (!this.$store.state.config.credit_rate) {
        return 1;
      }
      return this.$store.state.config.credit_rate;
    },
    percent() {
      if (!this.$store.state.config) {
        return 0;
      }
      if (!this.$store.state.config.deduction) {
        return 0;
      }
      return this.$store.state.config.deduction;
    },
    member() {
      return this.$store.state.userinfo;
    }
  },
  mounted() {
    let params = this.$route.query;
    if (!params.goods_id) {
      this.$toast.fail("产品资料错误");
      this.$router.back();
    }
    this.goods_id = params.goods_id;
    if (params.address_id) {
      this.address_id = params.address_id;
    }
    this.prepare();
  },
  methods: {
    onClickLeft() {
      this.$router.back();
    },
    prepare() {
      this.$api
        .post("credit_order/prepare", {
          goods: [{ id: this.goods_id, count: 1 }],
          address_id: this.address_id
        })
        .then(json => {
          this.goods = utils.fixListImage(json.data.goods);
          if (json.data.address) this.address = json.data.address;
          this.express = json.data.express;
          this.coculate();
        })
        .catch(err => {
          this.$toast.fail(err.msg || "产品资料错误");
          this.$router.back();
        });
    },
    coculate() {
      let total_price = 0;
      let total_credit = 0;
      this.goods.map(item => {
        let credit_rate = this.credit_rate;
        if (item.credit_rate) {
          credit_rate = item.credit_rate;
        }
        item.credit = Math.round(
          item.price * this.percent * 0.01 * credit_rate
        );
        item.release_price = item.price - item.credit / credit_rate;
        total_price += item.release_price * item.count;
        total_credit += item.credit * item.count;
        return item;
      });
      if (this.express && this.express.fee > 0) {
        total_price += this.express.fee;
      }
      this.total_price = Math.round(total_price * 100);
      this.total_credit = total_credit;
    },
    onSelect() {
      this.showList = true;
      if (this.showList && !this.list) {
        this.loadAddress();
      }
    },
    loadAddress() {
      this.$api
        .get("member.address/index")
        .then(json => {
          this.list = json.data;
        })
        .catch(err => {
          this.$toast.fail(err.msg || "地址资料加载失败");
        });
    },
    pickAddress(address) {
      this.showList = false;
      this.address = address;
    },
    manageAddress() {
      this.$router.push("/member/address");
    },
    addAddress() {
      this.$router.push("/member/address/detail");
    },
    importAddress() {
      this.$api.wechatReady(wx => {
        wx.openAddress({
          success: res => {
            var address = {};
            address.recive_name = res.userName;
            //address.recive_name = res.postalCode
            address.province = res.provinceName;
            address.city = res.cityName;
            address.area = res.countyName;
            address.address = res.detailInfo;
            //address.recive_name = res.nationalCode
            address.mobile = res.telNumber;
            //address.id = 0

            this.$api
              .post("member.address/save", { address: address, id: 0 })
              .then(json => {
                if (json.code == 1) {
                  this.$toast.success("保存成功");
                  this.loadAddress();
                }
              })
              .catch(error => {
                this.$toast.fail(error.msg || "保存失败");
              });
          }
        });
      });
    },
    onSubmit() {
      if (!this.address || !this.address.address_id) {
        this.$toast.fail("请选择收货地址");
        return;
      }
      if (this.member.credit < this.total_credit) {
        this.$toast.fail("您的积分不足");
        return;
      }
      this.$dialog
        .confirm({
          title: "确认购买",
          message: "现在下单购买?"
        })
        .then(() => {
          this.doSubmit();
        });
    },
    doSubmit() {
      this.$toast.loading();
      this.$api
        .post("credit_order/confirm", {
          goods: [{ id: this.goods_id, count: 1 }],
          address_id: this.address.address_id,
          credit: this.total_credit,
          total_price: this.total_price / 100,
          openid: this.$api.openid
        })
        .then(json => {
          if (json.code == 1) {
            let order_id = json.data.order_id;
            if (!order_id) {
              this.$toast.fail("下单失败");
              return;
            }
            this.$toast.success(json.msg);
            this.$api
              .wxPay(order_id, "PO")
              .then(() => {
                this.$router.replace(
                  "/member/credit_order/detail?id=" + order_id
                );
              })
              .catch(() => {
                this.$router.replace(
                  "/member/credit_order/detail?id=" + order_id
                );
              });
          }
        })
        .catch(err => {
          this.$toast.fail(err.msg || "下单失败");
        });
    }
  }
};
</script>
<style lang="scss">
.confirm-page {
  .price {
    font-size: 16px;
    &:before {
      content: "¥";
      font-size: 12px;
    }
  }
}
</style>