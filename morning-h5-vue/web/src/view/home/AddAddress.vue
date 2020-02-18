<template>
  <div>
    <div class="add-container">
      <div class="add-title">
        <h1>添加收货地址</h1>
      </div>
      <div class="add-box">
        <Form :model="formData" label-position="left" :label-width="100" :rules="ruleInline">
          <FormItem label="收件人" prop="userName">
            <i-input v-model="formData.userName" size="large"></i-input>
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
      <div class="add-submit">
        <Button type="primary">添加地址</Button>
      </div>
    </div>
  </div>
</template>

<script>
import Distpicker from 'v-distpicker';
export default {
  name: 'AddAddress',
  data () {
    return {
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
        fullArea: [
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
  methods: {
    getProvince (data) {
      this.formData.province = data.value;
    },
    getCity (data) {
      this.formData.city = data.value;
    },
    getCounty (data) {
      this.formData.area = data.value;
    }
  },
  components: {
    Distpicker
  }
};
</script>

<style scoped>
.add-container {
  margin: 15px auto;
  width: 60%;
  min-width: 600px;
}
.add-title {
  margin-bottom: 15px;
  text-align: center;
}
.add-submit {
  display: flex;
  justify-content: center;
}
</style>
