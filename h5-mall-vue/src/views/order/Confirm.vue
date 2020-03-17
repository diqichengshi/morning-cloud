<template>
  <div class="page product-index">
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

    <van-panel class="margin-top">
      <van-card
        v-for="item in products"
        :key="item.id"
        :num="1"
        :price="item.price"
        desc
        :title="item.title"
        :thumb="item.image"
      />
    </van-panel>

    <div class="margin-top">
      <van-cell title="邮费" :value="express.fee>0?express.fee:'免费包邮'"></van-cell>
    </div>

    <van-submit-bar :price="price" button-text="提交订单" @submit="onSubmit" />

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
      product_id: 0,
      products: [],
      group_id: 0,
      address_id: 0,
      address: {},
      express: { title: "", fee: 0 },

      showList: false,
      list: null,

      isWechat: config.isWechat && config.wxid
    };
  },
  computed: {
    price() {
      let total_price = 0;
      this.products.map(item => {
        total_price += item.price * item.count;
      });
      return Math.round(total_price * 100);
    }
  },
  mounted() {
    let params = this.$route.query;
    if (!this.product_id && !params.product_id) {
      this.$toast.fail("产品资料错误");
      this.$router.back();
    }
    this.product_id = params.product_id;
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
        .post("order/prepare", {
          products: [{ id: this.product_id, count: 1 }],
          address_id: this.address_id
        })
        .then(json => {
          this.products = utils.fixListImage(json.data.products);
          if (json.data.address) this.address = json.data.address;
          this.express = json.data.express;
        })
        .catch(err => {
          this.$toast.fail(err.msg || "产品资料错误");
          this.$router.back();
        });
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
      //console.log(address)
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
      this.$dialog
        .confirm({
          title: "确认下单",
          message: "确认下单支付?"
        })
        .then(() => {
          this.doSubmit();
        });
    },
    doSubmit() {
      this.$toast.loading();
      this.$api
        .post("order/confirm", {
          products: [{ id: this.product_id, count: 1 }],
          address_id: this.address.address_id,
          total_price: this.price / 100
        })
        .then(json => {
          if (json.code == 1) {
            let order_id = json.data.order_id;
            if(!order_id){
              this.$toast.fail('下单失败')
              return;
            }
            this.$toast.success(json.msg);
            if(json.data.payed){
              this.$router.replace("/member/order/detail?id=" + order_id);
              return;
            }
            this.$api.wxPay(order_id,'').then(()=>{
              this.$router.replace("/member/order/detail?id=" + order_id);
            }).catch(()=>{
              this.$router.replace(
                "/member/order/detail?id=" + order_id
              );
            })
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
  .address-item {
    .has-address {
      padding: 5px;
    }
    .no-address {
      line-height: 3em;
      color: #999;
    }
  }
  .van-card {
    background: #fff;
  }
}
</style>