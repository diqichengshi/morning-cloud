<template>
  <div>
    <Search></Search>
    <GoodsListNav></GoodsListNav>
    <div class="goods-list-container">
      <Alert show-icon class="tips-box">
        小提示
        <Icon type="ios-lightbulb-outline" slot="icon"></Icon>
        <template slot="desc">请点击商品前的选择框，选择购物车中的商品，点击付款即可。</template>
      </Alert>
      <Table border ref="selection" :columns="columns" :data="shoppingCart" size="large" @on-selection-change="select"
             no-data-text="您的购物车没有商品，请先添加商品到购物车再点击购买"></Table>
      <div class="address-container">
        <h3>收货人信息</h3>
        <div class="address-box">
          <div class="address-check">
            <div class="address-check-name">
              <span><Icon type="ios-checkmark-outline"></Icon> {{checkAddress.userName}}</span>
            </div>
            <div class="address-detail">
              <p>{{checkAddress.fullAddress}}</p>
            </div>
          </div>
          <Collapse>
            <Panel>
                选择地址
                <p slot="content">
                  <RadioGroup vertical size="large" @on-change="changeAddress">
                    <Radio :label="item.addressId" v-for="(item, index) in addressList" :key="index">
                      <span>{{item.userName}} {{item.provinceName}} {{item.cityName}} {{item.countyName}} {{item.userAdress}} {{item.userPhone}} {{item.userZipcode}}</span>
                    </Radio>
                  </RadioGroup>
                </p>
            </Panel>
          </Collapse>
        </div>
      </div>
      <div class="remarks-container">
        <h3>备注</h3>
        <i-input v-model="remarks" size="large" placeholder="在这里填写备注信息" class="remarks-input"></i-input>
      </div>
      <div class="invoices-container">
        <h3>发票信息</h3>
        <p>该商品不支持开发票</p>
      </div>
      <div class="pay-container">
        <div class="pay-box">
          <p><span>提交订单应付总额：</span> <span class="money"><Icon type="social-yen"></Icon> {{totalPrice.toFixed(2)}}</span></p>
          <div class="pay-btn">
            <router-link to="/pay"><Button type="error" size="large">支付订单</Button></router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Search from '@/view/Search';
import GoodsListNav from '@/view/nav/GoodsListNav';
import store from '@/vuex/store';
import {mapState} from 'vuex';
import {addressListApi} from '../vuex/api';
export default {
  name: 'Order',
  beforeRouteEnter (to, from, next) {
    window.scrollTo(0, 0);
    next();
  },
  created () {
    // TODO 这个地方暂时写死
    addressListApi('1').then(res => {
      this.addressList = res;
      // console.log('查询用户收货地址:' + JSON.stringify(this.addressList));
    });
  },
  data () {
    return {
      goodsCheckList: [],
      columns: [
        {type: 'selection', width: 58, align: 'center'},
        {
          title: '图片',
          key: 'picImg',
          width: 86,
          align: 'center',
          render: (h, params) => {
            return h('div', [h('img', {attrs: {src: params.row.picImg}})]);
          }
        },
        {title: '名称', key: 'name', align: 'center'},
        {title: '套餐', width: 198, key: 'package', align: 'center'},
        {title: '数量', key: 'count', width: 68, align: 'center'},
        {title: '价格', width: 68, key: 'showPrice', align: 'center'}
      ],
      addressList: [],
      checkAddress: {
        userName: '未选择',
        fullAddress: '请选择地址'
      },
      remarks: ''
    };
  },
  computed: {
    ...mapState(['userInfo', 'shoppingCart']),
    totalPrice () {
      let price = 0;
      this.goodsCheckList.forEach(item => {
        price += item.showPrice * item.count;
      });
      return price;
    }
  },
  methods: {
    select (selection, row) {
      console.log('购物车选择商品' + JSON.stringify(selection));
      this.goodsCheckList = selection;
    },
    changeAddress (data) {
      const father = this;
      this.addressList.forEach(item => {
        if (item.addressId === data) {
          father.checkAddress.userName = item.userName;
          father.checkAddress.fullAddress = `${item.userName} ${item.provinceName} ${item.cityName} ${item.countyName} ${item.userAdress} ${item.userPhone} ${item.userZipcode}`;
        }
      });
    }
  },
  mounted () {
    setTimeout(() => {
      this.$refs.selection.selectAll(true);
    }, 500);
  },
  components: {
    Search,
    GoodsListNav
  },
  store
};
</script>

<style scoped>
.goods-list-container {
  margin: 15px auto;
  width: 80%;
}
.tips-box {
  margin-bottom: 15px;
}
.address-container {
  margin-top: 15px;
}
.address-box {
  margin-top: 15px;
  padding: 15px;
  border: 1px #ccc dotted;
}
.address-check {
  margin: 15px 0px;
  height: 36px;
  display: flex;
  align-items: center;
}
.address-check-name {
  width: 120px;
  display: flex;
  justify-content: center;
  align-content: center;
  background-color: #ccc;
}
.address-check-name span {
  width: 120px;
  height: 36px;
  font-size: 14px;
  line-height: 36px;
  text-align: center;
  color: #fff;
  background-color: #f90013;
}
.address-detail {
  padding-left: 15px;
  font-size: 14px;
  color: #999999;
}
.remarks-container {
  margin: 15px 0px;
}
.remarks-input {
  margin-top: 15px;
}
.invoices-container p{
  font-size: 12px;
  line-height: 30px;
  color: #999;
}
.pay-container {
  margin: 15px;
  display: flex;
  justify-content: flex-end;
}
.pay-box {
  font-size: 18px;
  font-weight: bolder;
  color: #495060;
}
.money {
  font-size: 26px;
  color: #f90013;
}
.pay-btn {
  margin: 15px 0px;
  display: flex;
  justify-content: flex-end;
}
</style>
