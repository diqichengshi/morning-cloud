<template>
  <div class="page page-profile">
    <van-nav-bar title="个人资料" left-text="返回" left-arrow @click-left="onClickLeft" />
    <div class="container">
      <van-cell-group>
        <van-cell title="头像" is-link>
          <van-image class="avatar" :src="member.avatar" width="40px" height="40px" round></van-image>
        </van-cell>
        <van-cell title="账号" :is-link="canChange" :value="member.username" />
        <van-cell title="昵称" is-link :value="member.nickname" @click="setField('nickname','请填写昵称')" />
        <van-cell
          title="手机"
          is-link
          :value="ifEmpty(member.mobile,'未绑定')"
          @click="bindForm('mobile')"
        />
        <van-cell title="邮箱" is-link :value="ifEmpty(member.email,'未填写')" @click="setField('email','请填写邮箱')" />
      </van-cell-group>
      <van-cell-group class="margin-top">
        <van-cell
          title="姓名"
          is-link
          :value="ifEmpty(member.realname)"
          @click="setField('realname','请填写真实姓名')"
        />
        <van-cell title="性别" is-link @click="pickGender" :value="fmtGender(member.gender)" />
        <van-cell title="生日" is-link @click="pickDate" :value="fmtBirthday(member.birth)" />
        <van-cell title="地区" is-link @click="pickAddress" :value="areas" />
      </van-cell-group>

      <van-cell-group class="margin-top">
        <van-cell
          title="登录密码"
          :value="member.has_password?'修改密码':'设置密码'"
          is-link
          to="/member/password"
        />
        <van-cell
          title="安全密码"
          :value="member.has_secpassword?'修改安全密码':'设置安全密码'"
          is-link
          to="/member/sec_password"
        />
      </van-cell-group>
  </div>
    <van-popup v-model="showDatePicker" position="bottom">
      <van-datetime-picker
        v-model="birthDay"
        @confirm="setBirth"
        @cancel="initBirthDay"
        type="date"
        :min-date="minDate"
        :max-date="maxDate"
      />
    </van-popup>
    <van-popup v-model="showGenderPicker" position="bottom">
      <van-picker
        :show-toolbar="true"
        :columns="genders"
        :default-index="member.gender"
        @confirm="setGender"
      />
    </van-popup>
    <van-popup v-model="showAddressPicker" position="bottom">
      <van-picker
        ref="addPicker"
        :loading="addressLoading"
        :show-toolbar="true"
        :columns="addressColumns"
        @cancel="areaCancel"
        @change="areaChange"
        @confirm="setAddress"
      />
    </van-popup>
    <van-dialog v-model="promptShow" :title="fieldTitle" show-cancel-button @confirm="updateField">
      <van-cell-group>
        <van-field class="prompt-input" ref="fieldInput" v-model="fieldValue" />
      </van-cell-group>
    </van-dialog>
    <van-popup v-model="showBindForm" closeable position="bottom">
      <div class="padding-tb-40">
      <div v-if="!member.mobile_bind || step>0">
        <van-cell-group>
          <van-field v-model="mobile" label="手机号" placeholder="请输入手机号"  />
          <van-field v-model="smsCode" center clearable label="短信验证码" placeholder="请输入短信验证码">
            <van-button slot="button" size="small" :disabled="iscounting > 0" type="primary" @click="sendSMS(mobile)">发送验证码<span v-if="iscounting>0">({{iscounting}})</span></van-button>
          </van-field>
        </van-cell-group>
        <div class="submit-btn">
          <van-button type="info" @click="bindMobile">绑定手机</van-button>
        </div>
      </div>
      <div v-else>
        <van-cell-group>
          <van-field :value="member.mobile" readonly label="已绑定手机号" />
          <van-field v-model="smsCode" center clearable label="短信验证码" placeholder="请输入短信验证码">
            <van-button slot="button" size="small" :disabled="iscounting > 0" type="primary" @click="sendSMS(member.mobile)">发送验证码<span v-if="iscounting>0">({{iscounting}})</span></van-button>
          </van-field>
        </van-cell-group>
        <div class="text-muted">请先解绑原手机号码</div>
        <div class="submit-btn">
          <van-button type="info" @click="unbindMobile">下一步</van-button>
        </div>
      </div>
      </div>
    </van-popup>
  </div>
</template>
<script >
import axios from "axios";
import store from "../../store";
import utils from "../../utils";

let areaList = null;
let areaTree = {};
let loaded = false;
let areaDelay = 0;
let interval=0
export default {
  data() {
    return {
      showDatePicker: false,
      minDate: new Date("1900-01-01"),
      maxDate: new Date(),
      birthDay: new Date(),
      showGenderPicker: false,
      genders: ["保密", "男", "女"],
      showBindForm: false,
      showBindType: "",
      step : 0,
      smsCode: "",
      mobile: "",
      iscounting:0,
      emailCode: "",
      email: "",
      addressLoading: true,
      showAddressPicker: false,
      addressColumns: [
        {
          values: [],
          defaultIndex: 0
        },
        {
          values: [],
          defaultIndex: 0
        },
        {
          values: [],
          defaultIndex: 0
        }
      ],
      promptShow: false,
      fieldName: "",
      fieldTitle: "",
      fieldValue: ""
    };
  },
  computed: {
    member() {
      return store.state.userinfo;
    },
    areas() {
      let vals = [];
      if (this.member.province) {
        vals.push(this.member.province);
        if (this.member.city) {
          vals.push(this.member.city);
          if (this.member.county) {
            vals.push(this.member.county);
          }
        }
      }
      return vals.length > 0 ? vals.join("/") : "未填写";
    },
    canChange() {
      return this.member.username && this.member.username.indexOf("#") > -1;
    }
  },
  mounted() {
    if (!store.state.userinfo.id) {
      store.dispatch("updateUserinfo").then(() => {
        this.initBirthDay();
      });
    } else {
      this.initBirthDay();
    }
    interval = setInterval(()=>{
      if(this.iscounting>0){
        this.iscounting -= 1;
      }
    },1000);
  },
  destroyed() {
    loaded = false;
    areaList = null;
    areaTree = {};
    clearInterval(interval)
  },
  methods: {
    onClickLeft() {
      this.$router.back();
    },
    ifEmpty(val, dft = "未填写") {
      return val ? val : dft;
    },
    initBirthDay() {
      if (store.state.userinfo.birth > 0) {
        this.birthDay = new Date(store.state.userinfo.birth * 1000);
      }
      this.showDatePicker = false;
    },
    fmtBirthday(timestamp) {
      if (!timestamp || timestamp < 1) return "未填写";
      let date = new Date(timestamp * 1000);

      return (
        date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate()
      );
    },
    fmtGender(gender) {
      if (gender == 1) {
        return "男";
      } else if (gender == 2) {
        return "女";
      }
      return "未知";
    },
    bindForm(type) {
      this.showBindForm = true;
      this.showBindType = type;
      this.step = 0;
      if(!this.member.mobile_bind){
        this.mobile = this.member.mobile;
      }
      if(!this.member.email_bind){
        this.email = this.member.email;
      }
    },
    sendSMS(mobile) {
      if(!mobile){
        this.$toast.fail('请填写手机号码')
        return
      }
      if(!mobile.match(/^1[3-9]\d{9}$/)){
        this.$toast.fail('手机号码格式错误')
        return
      }
      this.$api.post('member/smscode',{mobile:mobile}).then(result=>{
        this.$toast.success(result.msg||'发送成功');
        this.iscounting = 60
      }).catch(err=>{
        this.$toast.fail(err.msg||'发送失败');
      })
    },
    bindMobile() {
      if(!this.mobile){
        this.$toast.fail('请填写手机号码')
        return
      }
      if(this.member.mobile_bind && this.mobile ==  this.member.mobile){
        this.$toast.fail('手机号码未变更')
        return
      }
      if(!this.mobile.match(/^1[3-9]\d{9}$/)){
        this.$toast.fail('手机号码格式错误')
        return
      }
      if(!this.smsCode){
        this.$toast.fail('请填写验证码')
        return
      }
      this.$api.post('member/bind_mobile',{mobile:this.mobile,code:this.smsCode,step:1}).then(result=>{
        this.$toast.success(result.msg||'绑定成功');
        store.dispatch("updateUserinfo");
        this.showBindForm = false;
      }).catch(err=>{
        this.$toast.fail(err.msg||'绑定失败');
        this.smsCode = ''
      })
    },
    unbindMobile() {
      if(!this.member.mobile_bind){
        this.step = 1;
        this.$toast('未绑定手机号,无需解绑')
        return;
      }
      if(!this.smsCode){
        this.$toast.fail('请填写验证码')
        return
      }
      this.$api.post('member/bind_mobile',{mobile:this.member.mobile,code:this.smsCode,step:0}).then(result=>{
        this.$toast.success(result.msg||'验证通过');
        this.iscounting = 0
        this.smsCode = ''
        this.step = 1;
      }).catch(err=>{
        this.$toast.fail(err.msg||'验证失败');
        this.smsCode = ''
      })
    },
    pickDate() {
      this.showDatePicker = true;
    },
    setBirth(value) {
      this.showDatePicker = false;
      let timestamp = value.getTime() * 0.001;
      this.updateInfo(
        {
          birth: value.toDateString()
        },
        {
          birth: timestamp
        }
      );
    },
    pickGender() {
      this.showGenderPicker = true;
    },
    setGender(value, index) {
      this.showGenderPicker = false;
      this.updateInfo({ gender: index });
    },
    loadAddress() {
      loaded = true;
      axios
        .get("static/area.json", { baseURL: "/" })
        .then(res => {
          areaList = res.data;
          this.initAddress();
          this.addressLoading = false;
        })
        .catch(() => {
          this.$toast.fail("地区信息加载失败");
          loaded = false;
        });
    },
    initAddress() {
      areaTree = utils.sortAddressTree(areaList);

      this.$refs.addPicker.setColumnValues(0, areaTree["00"]);

      if (this.member.province && areaTree[this.member.province]) {
        this.$refs.addPicker.setColumnValue(0, this.member.province);
      }

      let province = this.$refs.addPicker.getColumnValue(0);
      if (areaTree[this.member.province]) {
        this.$refs.addPicker.setColumnValues(1, areaTree[province]);
      }
      if (this.member.city && areaTree[this.member.province]) {
        this.$refs.addPicker.setColumnValue(1, this.member.city);
      }

      let city = this.$refs.addPicker.getColumnValue(1);
      if (areaTree[this.member.province]) {
        this.$refs.addPicker.setColumnValues(2, areaTree[city]);
      }
      if (this.member.county) {
        this.$refs.addPicker.setColumnValue(2, this.member.county);
      }
    },
    areaCancel() {
      this.showAddressPicker = false;
    },
    pickAddress() {
      this.showAddressPicker = true;
      if (!loaded) {
        this.loadAddress();
      }
    },
    areaChange(picker, values, idx) {
      if (!loaded) return;
      clearTimeout(areaDelay);
      areaDelay = setTimeout(() => {
        if (idx < 1 && areaTree[values[0]]) {
          picker.setColumnValues(1, areaTree[values[0]]);
        }
        if (idx < 2 && areaTree[values[1]]) {
          picker.setColumnValues(2, areaTree[values[1]]);
        }
      }, 400);
    },
    setAddress(values) {
      this.showAddressPicker = false;
      this.updateInfo({
        province: values[0],
        city: values[1],
        county: values[2]
      });
    },
    setField(field, title) {
      this.promptShow = true;
      this.fieldName = field;
      this.fieldTitle = title;
      this.fieldValue = this.member[field];

      this.$refs.fieldInput && this.$refs.fieldInput.focus();
    },
    updateField() {
      this.updateInfo({
        [this.fieldName]: this.fieldValue
      }).then(() => {
        this.promptShow = false;
      });
    },
    updateInfo(data, localData = null) {
      if (localData === null) {
        localData = data;
      }
      this.$toast.loading("正在保存...");

      return this.$api
        .post("member/update_profile", data)
        .then(res => {
          store.commit("setUserinfoPart", localData);
          this.$toast.success(res.msg || "保存成功");
        })
        .catch(err => {
          this.$toast.fail(err.msg || "保存失败");
        });
    },
    onUpdate() {}
  }
};
</script>
<style lang="scss">

.page-profile{
.prompt-input {
  border: 1px #ddd solid;
  margin: 20px;
  width: calc(100% - 40px);
}
.submit-btn .van-button{
  width: 100%;
}
}
</style>