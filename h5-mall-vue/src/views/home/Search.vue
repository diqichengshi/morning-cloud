<template>
  <div class="page search-page">
    <van-nav-bar left-text="返回" left-arrow @click-left="onClickLeft">
      <van-search
        slot="title"
        shape="round"
        placeholder="请输入搜索关键词"
        v-model="keyword"
        @search="onSearch"
        @cancel="onCancel"
        @clear="onClear"
      />
    </van-nav-bar>
    <van-dropdown-menu>
      <van-dropdown-item v-model="price" :options="priceOption" @change="reload" />
      <van-dropdown-item v-model="model" :options="modelOption" @change="reload" />
    </van-dropdown-menu>
    <div class="container">
    <van-list
      v-model="loading"
      :error="error"
      :finished="finished"
      finished-text="没有更多了"
      @load="loadNext"
    >
      <van-card
        v-for="item in lists"
        :key="item.id"
        :tag="getTag(item.model)"
        :price="item.price"
        :desc="item.vice_title"
        :title="item.title"
        :thumb="item.image"
        @click="toDetail(item.model,item.id)"
      />
    </van-list>
    </div>
  </div>
</template>
<script >
import utils from "../../utils";

export default {
  data() {
    return {
      isLoading: true,
      keyword: "",
      price: "",
      model: "",
      priceOption: [
        { text: "不限价格", value: "" },
        { text: "100以内", value: "0-100" },
        { text: "100-200", value: "100-200" },
        { text: "200-500", value: "200-500" },
        { text: "500-1000", value: "500-1000" },
        { text: "1000-5000", value: "1000-5000" },
        { text: "5000以上", value: 5000 }
      ],
      modelOption: [
          {text:'全部商品',value:''},
          {text:'积分专区',value:'goods'},
          {text:'团购专区',value:'groupbuy'}
      ],
      lists: [],
      page: 1,
      loading: true,
      finished: false,
      error: false
    };
  },
  mounted() {
    let query = this.$route.query;
    if (query && query.keyword) {
      this.keyword = query.keyword;
    }
    this.loadData();
  },
  methods: {
    onClickLeft() {
      this.$router.back();
    },
    toDetail(model, id) {
      if (model == "goods") model = "credit";
      this.$router.push("/" + model + "/detail/" + id);
    },
    getTag(model) {
      switch (model) {
        case "goods":
          return "积分专区";
        case "groupbuy":
          return "团购专区";
        default:
          "";
      }
    },
    loadData() {
      this.loading = true;
      this.error = false;
      this.$api
        .post("common/search", {
          keyword: this.keyword,
          price: this.price,
          model: this.model,
          page: this.page
        })
        .then(json => {
          this.loading = false;
          let data = utils.fixListImage(json.data.lists);
          this.lists = this.lists.concat(data);
          if (
            !json.data.lists ||
            json.data.lists.length <= 0 ||
            json.data.page >= json.data.total_page
          ) {
            this.finished = true;
          }
        })
        .catch(err => {
          console.log(err);
          this.loading = false;
          this.error = true;
        });
    },
    loadNext() {
      if (!this.error) {
        this.page++;
      }
      this.loadData();
    },
    reload() {
      this.finished = false;
      this.lists = [];
      this.page = 1;
      this.loadData();
    },
    onSearch() {
      this.reload();
    },
    onCancel() {
      this.keyword = "";
      this.reload();
    },
    onClear() {
      this.keyword = "";
      this.reload();
    }
  }
};
</script>
<style lang="scss">
.search-page {
  .van-search {
    padding-top: 5px;
    padding-bottom: 5px;
  }
  .van-list {
    margin-top: 10px;
  }
  .van-card {
    background: #fff;
  }
}
</style>