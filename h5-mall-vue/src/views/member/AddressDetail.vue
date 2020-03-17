
<template>
  <div class="page about">
    <van-nav-bar title="地址编辑" left-text="返回" left-arrow @click-left="onClickLeft" />
    <van-address-edit
      :area-list="areaList"
      :address-info="address"
      show-postal
      show-delete
      show-set-default
      show-search-result
      :search-result="searchResult"
      :area-columns-placeholder="['请选择', '请选择', '请选择']"
      @save="onSave"
      @delete="onDelete"
    />
  </div>
</template>
<script >
import axios from "axios";

export default {
  data() {
    return {
      id: 0,
      isActing: false,
      address: {},
      areaList: {},
      searchResult: []
    };
  },
  mounted() {
    this.loadAddress();
    if (this.$route.query.id && this.$route.query.id > 0) {
      this.id = this.$route.query.id;
      this.loadData();
    }
  },
  methods: {
    loadData() {
      this.$api.post("member.address/view", { id: this.id }).then(json => {
        let address = {
          id: json.data.address_id,
          name: json.data.recive_name,
          tel: json.data.mobile,
          province: json.data.province,
          city: json.data.city,
          county: json.data.area,
          addressDetail: json.data.address,
          areaCode: "",
          postalCode: json.data.code,
          isDefault: json.data.is_default
        };
        this.address = address;
        this.searchCode();
      });
    },
    loadAddress() {
      axios.get("static/area.json", { baseURL: "/" }).then(res => {
        this.areaList = res.data;
        this.searchCode();
      });
    },
    searchCode() {
      if (
        this.areaList.province_list &&
        this.address.province &&
        !this.address.areaCode
      ) {
        if (this.address.county) {
          for (let code in this.areaList.county_list) {
            if (this.address.county == this.areaList.county_list[code]) {
              this.address.areaCode = code;
            }
          }
        } else if (this.address.city) {
          for (let code in this.areaList.city_list) {
            if (this.address.city == this.areaList.city_list[code]) {
              this.address.areaCode = code;
            }
          }
        } else if (this.address.province) {
          for (let code in this.areaList.province_list) {
            if (this.address.province == this.areaList.province_list[code]) {
              this.address.areaCode = code;
            }
          }
        }
      }
    },
    onClickLeft() {
      this.$router.back();
    },
    onSave(res) {
      this.$toast.loading({
        message: "加载中...",
        forbidClick: true
      });
      this.$api
        .post("member.address/save", { id: res.id, address:{
          recive_name: res.name,
          mobile: res.tel,
          province: res.province,
          city: res.city,
          area: res.county,
          address: res.addressDetail,
          //areaCode: "",
          code: res.postalCode,
          is_default: res.isDefault?1:0
        } })
        .then(res => {
          this.$toast.success(res.msg || "保存成功");
          this.$router.back();
        })
        .catch(err => {
          this.$toast.fail(err.msg || "保存失败");
        });
    },
    onDelete(res) {
      this.$toast.loading({
        message: "加载中...",
        forbidClick: true
      });
      this.$api
        .post("member.address/delete", { id: res.id })
        .then(res => {
          this.$toast.success(res.msg || "删除成功");
          this.$router.back();
        })
        .catch(err => {
          this.$toast.fail(err.msg || "删除失败");
        });
    }
  }
};
</script>