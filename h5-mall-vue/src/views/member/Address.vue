
<template>
  <div class="page about">
    <van-nav-bar title="地址列表" left-text="返回" left-arrow @click-left="onClickLeft" />
    <van-address-list v-model="chosenAddressId" :list="list" @add="onAdd" @edit="onEdit">
      <div slot="top">
        <div v-if="isLoading" class="empty-box">
          <van-loading size="24px">加载中...</van-loading>
        </div>
        <div v-else-if="!list || list.length<1" class="empty-box">尚未添加过地址</div>
      </div>
      <div slot="default" class="text-center margin-top">
        <van-button
          v-if="isWechat"
          plain
          type="primary"
          style="width:60%"
          @click="importAddress"
        >从微信导入</van-button>
      </div>
    </van-address-list>
  </div>
</template>
<script >
import config from "../../config";

export default {
  data() {
    return {
      isLoading: true,
      chosenAddressId: 1,
      list: [],
      isWechat: config.isWechat && config.wxid
    };
  },
  mounted() {
    this.loadData();
  },
  methods: {
    loadData() {
      this.$api.post("member.address/index").then(json => {
        this.isLoading = false;
        this.list = json.data.map(item => {
          item.id = item.address_id;
          item.name = item.recive_name;
          item.tel = item.mobile;
          let component = [];
          if (item.province) component.push(item.province);
          if (item.city) component.push(item.city);
          if (item.area) component.push(item.area);
          if (item.address) component.push(item.address);
          item.address = component.join(" ");
          return item;
        });
      });
    },
    onClickLeft() {
      this.$router.back();
    },
    onAdd() {
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
                  this.loadData();
                }
              })
              .catch(error => {
                this.$toast.fail(error.msg || "保存失败");
              });
          }
        });
      });
    },
    onEdit(item, index) {
      //this.$toast("编辑地址:" + index);
      this.$router.push("/member/address/detail?id=" + this.list[index].id);
    }
  }
};
</script>