<template>
  <div>
    <div class="address-box" v-for="(item, index) in addressList" :key="index">
      <div class="address-header">
        <span>{{item.userName}}</span>
        <div class="address-action">
          <span @click="edit(index)"><Icon type="edit"></Icon> 修改</span>
          <span @click="del(index)"><Icon type="trash-a"></Icon> 删除</span>
        </div>
      </div>
      <div class="address-content">
        <p><span class="address-content-title"> 收 货 人 :</span> {{item.userName}}</p>
        <p><span class="address-content-title">收货地区:</span> {{item.provinceName}} {{item.cityName}} {{item.countyName}}</p>
        <p><span class="address-content-title">收货地址:</span> {{item.userAdress}}</p>
        <p><span class="address-content-title">邮政编码:</span> {{item.userZipcode}}</p>
      </div>
    </div>
    <Modal v-model="modal" width="530">
        <p slot="header">
          <Icon type="edit"></Icon>
          <span>修改地址</span>
        </p>
        <div>
            <Form :model="formData" label-position="left" :label-width="100" :rules="ruleInline">
              <FormItem label="收件人" prop="name">
                <i-input v-model="formData.name" size="large"></i-input>
              </FormItem>
              <FormItem label="收件地区" prop="fullArea">
                <Distpicker :province="formData.provinceName" :city="formData.cityName" :area="formData.countyName"
                            @province="getProvince" @city="getCity" @area="getCounty"></Distpicker>
              </FormItem>
              <FormItem label="收件地址" prop="userAdress">
                <i-input v-model="formData.userAdress" size="large"></i-input>
              </FormItem>
              <FormItem label="手机号码" prop="userPhone">
                <i-input v-model="formData.userPhone" size="large"></i-input>
              </FormItem>
              <FormItem label="邮政编码" prop="userZipcode">
                <i-input v-model="formData.userZipcode" size="large"></i-input>
              </FormItem>
            </Form>
        </div>
        <div slot="footer">
            <Button type="primary" size="large" long @click="editAction">修改</Button>
        </div>
    </Modal>
  </div>
</template>

<script>
import store from '@/vuex/store';
import Distpicker from 'v-distpicker';
import {addressListApi} from '../../vuex/api';
export default {
  name: 'MyAddress',
  data () {
    return {
      modal: false,
      addressList: [],
      formData: {
        userName: '',
        userAdress: '',
        fullArea: '',
        userPhone: '',
        userZipcode: '',
        provinceName: '广东省',
        cityName: '广州市',
        countyName: '天河区'
      },
      ruleInline: {
        userName: [
          { required: true, message: '请输入姓名', trigger: 'blur' }
        ],
        userAdress: [
          { required: true, message: '请输入地址', trigger: 'blur' }
        ],
        userZipcode: [
          { required: true, message: '请输入邮政编码', trigger: 'blur' }
        ],
        userPhone: [
          { required: true, message: '手机号不能为空', trigger: 'blur' },
          { type: 'string', pattern: /^1[3|4|5|7|8][0-9]{9}$/, message: '手机号格式出错', trigger: 'blur' }
        ]
      }
    };
  },
  created () {
    addressListApi('1').then(res => {
      this.addressList = res;
      // console.log('查询用户收货地址:' + JSON.stringify(this.addressList));
    });
  },
  computed: {
  },
  methods: {
    edit (index) {
      this.modal = true;
      this.formData.provinceName = this.address[index].provinceName;
      this.formData.cityName = this.address[index].cityName;
      this.formData.countyName = this.address[index].countyName;
      this.formData.userAdress = this.address[index].userAdress;
      this.formData.userName = this.address[index].userName;
      this.formData.userPhone = this.address[index].userPhone;
      this.formData.userZipcode = this.address[index].userZipcode;
    },
    editAction () {
      this.modal = false;
      this.$Message.success('修改成功');
    },
    del (index) {
      this.$Modal.confirm({
        title: '信息提醒',
        content: '你确定删除这个收货地址',
        onOk: () => {
          this.$Message.success('删除成功');
        },
        onCancel: () => {
          this.$Message.info('取消删除');
        }
      });
    }
  },
  components: {
    Distpicker
  },
  store
};
</script>

<style scoped>
.address-box {
  padding: 15px;
  margin: 15px;
  border-radius: 5px;
  box-shadow: 0px 0px 5px #ccc;
}
.address-header {
  height: 35px;
  display: flex;
  justify-content: space-between;
  color: #232323;
  font-size: 18px;
}
.address-content {
  font-size: 14px;
}
.address-content-title {
  color: #999;
}
.address-action span{
  margin-left: 15px;
  font-size: 14px;
  color: #2d8cf0;
  cursor: pointer;
}
</style>
