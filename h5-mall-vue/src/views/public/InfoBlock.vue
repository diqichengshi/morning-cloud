<template>
    <div class="info-block">
      <div v-if="title != ''" class="info-head">
        <div class="info-head-text">{{title}}</div>
      </div>
      <slot name="header"></slot>
      <div class="info-content">
        <slot />
      </div>
    </div>
</template>
<script>

export default {
  props: {
    title: { type: String, default: '' }
  },
  data() {
    return {};
  },
}
</script>
<style lang="scss">
.info-block{
    border-radius:5px;
    background:#fff;
    box-shadow: 1px 1px 5px 2px rgba(0,0,0,.02);
    .info-head{
        padding-top:20px;
        .info-head-text{
            background:url(/static/home/img_fillet_rectangle.png) right center no-repeat;
            background-size:cover;
            line-height: 2em;
            color: #fff;
            text-indent: 1em;
            padding-right:1.5em;
            float: left;
        }
        &:after{
            content:"";
            display: block;
            height:0;
            clear:both;
        }
    }
    .info-content{
        padding:20px;
    }
}
</style>