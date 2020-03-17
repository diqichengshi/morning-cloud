<template>
  <div id="splash">
      <img src="/static/logo.png">
  </div>
</template>

<script>

</script>

<style lang="scss">
  #splash{
    position: fixed;
    top: 0;
    left: 0;
    z-index: 999;
    width: 100vw;
    height: 100vh;
    opacity: 1;
    transition: opacity .3s ease;
    box-sizing: border-box;
    background:#fafafa;
    &.fade-enter,&.fade-leave-to{
      opacity: 0;
    }
    img{
        position: absolute;
        left:50%;
        top:45%;
        width:100px;
        height:75px;
        margin-left:-37px;
        margin-top:-50px;
    }
  }
</style>