<template>
  <div  ref="listRoot">
  <van-grid class="goods-list" :column-num="columnNum" :gutter="gutter" :border="false">
    <van-grid-item v-for="goods in lists" :key="goods.id" :to="'/credit/detail/'+goods.id">
      <div class="goods-item" :style="'width:'+itemSize+'px'">
        <img fit="scale-down" :width="itemSize" :height="itemSize" v-lazy="goods.image" />
        <h4 class="card-title van-multi-ellipsis--l2">{{goods.title}}</h4>
        <div class="prodinfo">
          <div class="price">{{coculate(goods,  percent, credit_rate)}} + {{credit(goods,  percent, credit_rate)}}<van-icon name="diamond-o"></van-icon></div>
          <div class="buybtn">
          <van-icon name="cart-o"></van-icon>
          </div>
        </div>
      </div>
    </van-grid-item>
  </van-grid>
  </div>
</template>
<script>

export default {
  props: {
    lists: { type: Array, required: true },
    gutter: { type: Number, default: 10 },
    boxWidth: { type: Number, default: 0 },
    columnNum: { type: Number, default: 2 }
  },
  data() {
    return {
      origWidth:0
    };
  },
  computed: {
    itemSize() {
      let width = this.boxWidth > 0 ?
        this.boxWidth :
        this.origWidth;
      if (width > 0) {
        return (
          (width -
            (this.columnNum + 1) * this.gutter) /
          this.columnNum
        );
      }
      return 200;
    },
    credit_rate() {
      if(!this.$store.state.config){
        return 1;
      }
      if(!this.$store.state.config.credit_rate){
        return 1;
      }
      return this.$store.state.config.credit_rate
    },
    percent() {
      if(!this.$store.state.config){
        return 0;
      }
      if(!this.$store.state.config.deduction){
        return 0;
      }
      return this.$store.state.config.deduction
    }
  },
  mounted() {
    this.origWidth = this.$refs.listRoot.offsetWidth;
  },
  methods: {
    coculate(goods, percent, credit_rate) {
      if(goods.credit_rate){
        credit_rate = goods.credit_rate
      }
      return goods.price - Math.round(this.credit(goods, percent, credit_rate)*100/credit_rate)*0.01
    },
    credit(goods, percent, credit_rate) {
      if(goods.credit_rate){
        credit_rate = goods.credit_rate
      }
      return Math.round(goods.price*percent*0.01*credit_rate)
    }
  }
}
</script>
<style lang="scss">
.goods-list{
  .van-grid-item{
    .van-grid-item__content{
    padding:0;
    }
  }
}
.goods-item {
  background: #fff;
  border-radius:5px;
  overflow: hidden;

  .card-title {
    font-size: 14px;
    text-align: left;
    padding:0 5px;
    box-sizing: border-box;
    margin:5px 0;
    width: 100%;
  }
  .prodinfo{
    display:flex;
    flex-direction: row;
    line-height:32px;
    .price{
      flex:1;
      color:#b18856;
      font-size:14px;
      width:40%;
      font-weight:bold;
      white-space: nowrap;
      &:before{
        content:"￥";
        font-size:10px;
      }
      .van-icon{
        vertical-align: middle;
      }
    }
    .buybtn{
      padding-top:5px;
      padding-right:5px;
    }
  }
  .my-btn{
    flex:0 0 80px;
    border:0;
    background:url(/static/home/img_fillet_rectangle_three.png) center center no-repeat;
    color:#fff;
    background-size:contain;
    line-height:32px;
    height:32px;
    width: 80px;
    .van-icon{
      vertical-align: middle;
    }
  }
}

</style>