<template>
  <div class="address-list">
    <van-radio-group v-model="address_id" @change="onChange">
      <van-cell v-for="(item, idx) in lists" :key="item.address_id" class="address-item" @click="setAddress(idx)">
        <van-radio :name="idx">
          <div class="address-name">{{item.recive_name}}, {{item.mobile}}</div>
          <div class="address-vice">{{item.province}} {{item.city}} {{item.area}} {{item.address}}</div>
        </van-radio>
        <div slot="right-icon" @click="editAddress(item.address_id)"><van-icon  name="edit" /></div>
      </van-cell>
    </van-radio-group>
  </div>
</template>
<script>
export default {
  props: {
    lists: { type: Array, required: true },
    selectedId:{type: Number, default: 0}
  },
  data() {
    return {
      address_id: 0
    };
  },
  mouted() {
    if(this.selectedId>0){
      this.address_id = this.selectedId
    }
  },
  methods: {
    onChange(idx) {
      console.log(idx)
      //this.$emit('pick',this.lists[idx])
    },
    setAddress(idx) {
      this.$emit('pick',this.lists[idx])
    },
    editAddress(id) {
      this.$router.push('/member/address/detail?id='+id)
    }
  }
};
</script>
<style lang="scss">
.address-item {
  .address-name {
    font-size: 16px;
  }
  .address-vice {
    font-size: 13px;
    color: #666;
  }
}
</style>