<template>
  <div class="page confirm-page">
    <van-nav-bar title="提现" left-text="返回" left-arrow @click-left="onClickLeft" right-text="提现记录" @click-right="onRightClick" />
    <div class="container">
      <div class="text-muted" v-html="cashtip"></div>
      <van-cell-group class="margin-top">
        <van-field v-model="amount" size="large" label="提现金额" :error-message="amounttip" placeholder="请输入提现金额" />
      </van-cell-group>
      <div class="text-muted" >可提现金额:{{formatMoney(member.reward - member.froze_reward)}}<span v-if="member.froze_reward > 0">&nbsp;冻结金额:{{formatMoney(member.froze_reward)}}</span></div>
      <van-cell-group>
        <van-field
          readonly
          clickable
          label="提现方式"
          input-align="right"
          :value="cashtitle"
          placeholder="选择提现方式"
          is-link
          @click="showType = true"
        />
      </van-cell-group>
      <template v-if="cashtype=='wechat'">
        <div v-if="wechatlimit">{{wechatlimit}}</div>
        <van-cell-group>
          <van-cell title="收款账号">
            <div>
              <span v-if="!wechat || !wechat.nickname">
                -未关注-
              </span>
              <span v-else>
              {{wechat.nickname}}
              <van-image :src="wechat.avatar" round width="30" height="30" />
              </span>
            </div>
          </van-cell>
          <van-field
            label="真实姓名"
            v-model="formdata.realname"
            placeholder="请填写真实姓名"
          ></van-field>
        </van-cell-group>
        <div v-if="wechat && wechat.id>0" class="text-center qrcodeimg" @click="showqrcode">
          <van-image class="qrcode-img" :src="wechat.qrcode" fit="contain"></van-image>
          <div v-if="wechat.is_follow == 1">已关注</div>
          <div v-else>未关注</div>
        </div>
      </template>
      <div v-if="cashtype=='alipay'">
        <van-cell-group>
          <van-field
            label="支付宝账户"
            v-model="formdata.alipay"
            placeholder="请填写支付宝账户"
          ></van-field>
        </van-cell-group>
      </div>
      <template v-if="cashtype=='unioncard'">
        <van-cell-group>
          <van-field
            readonly
            clickable
            label="提现账户"
            :value="carddesc"
            placeholder="选择提现账户"
            is-link
            @click="showCards = true"
          />

          <template v-if="formdata.card_id==0">
            <van-field clearable label="银行" v-model="formdata.bank" placeholder="填写或选择提现银行">
              <van-button slot="button" size="small" type="primary" @click="showBanks = true">选择</van-button>
            </van-field>
            <van-field clearable label="开户行" v-model="formdata.bankname" placeholder="请填写开户行" />
            <van-field clearable label="开户名" v-model="formdata.cardname" placeholder="请填写开户名称" />
            <van-field clearable label="卡号号" v-model="formdata.cardno" placeholder="请填写银行卡号" />
          </template>
        </van-cell-group>
      </template>
      <div class="submit-btn">
        <div class="text-muted">{{tiptext}}</div>
        <van-button
          type="primary"
          size="large"
          :loading="loading"
          :disabled="!enabled"
          @click="submitForm"
        >提交申请</van-button>
      </div>
    </div>
    <van-popup v-model="showType" position="bottom">
      <van-picker
        title="选择提现方式"
        show-toolbar
        :columns="picker"
        v-model="typeidx"
        value-key="title"
        @confirm="onConfirm"
        @cancel="showType = false"
      />
    </van-popup>
    <van-popup v-model="showCards" position="bottom">
      <van-picker
        title="选择银行卡"
        show-toolbar
        :columns="cards"
        v-model="cardidx"
        value-key="desc"
        @confirm="onCardConfirm"
        @cancel="showCards = false"
      />
    </van-popup>
    <van-popup v-model="showBanks" position="bottom">
      <van-picker
        title="选择开户银行"
        show-toolbar
        :columns="banklist"
        v-model="bankidx"
        @confirm="onBankConfirm"
        @cancel="showBanks = false"
      />
    </van-popup>
  </div>
</template>
<script >
import config from "../../config";
import utils from "../../utils";
import Vue from "vue";
import { ImagePreview } from "vant";

Vue.use(ImagePreview);

let amount_set_delay = 0;
let cashconfig={}

export default {
  data() {
    return {
      amount: "",

      cashtip: "",
      tiptext: "",
      amounttip:'',
      ispack: false, //是否仅支持红包

      showType: false,
      picker: [{ title: "请选择" }],
      typeidx: 0,
      cashtitle: "",
      cashtype: "",

      showCards: false,
      cards: null,
      carddesc: "新建银行卡资料",
      cardidx: 0,

      showBanks: false,
      banklist: [""],
      bankidx: 0,
      wechat: {},

      formdata: {
        realname: "",
        alipay: "",
        card_id: 0,
        bank: "",
        bankname: "",
        cardname: "",
        cardno: ""
      },

      enabled: false,
      amountchanged: false,
      amount_set_delay: 0,
      loading: false
    };
  },
  computed: {
    member() {
      return this.$store.state.userinfo;
    },
    userinfo() {
      return this.$store.state.userinfo;
    },
    balance() {
      return this.member.reward - this.member.froze_reward
    }
  },
  watch: {
    amount() {
      this.checkState();
    }
  },
  mounted() {
    this.loadData();
  },
  methods: {
    onClickLeft() {
      this.$router.back();
    },
    onRightClick() {
      this.$router.push('/member/cash_log')
    },
    formatMoney(money, power = 2) {
      if (!money) money = 0;
      return (money / 100).toFixed(power);
    },
    onConfirm(curtype) {
      if (!curtype) {
        curtype = { title: "", type: "" };
      }
      this.cashtype = curtype.type;
      this.cashtitle = curtype.title;
      this.showType = false;
      if (this.cashtype == "unioncard") {
        this.loadCard();
      }
    },
    loadData() {
      this.$api
        .post("member.account/cash_config")
        .then(json => {
          if (json.code == 1) {
            let wechat =
              json.data.wechats && json.data.wechats.length > 0
                ? json.data.wechats[0]
                : {};

            wechat = utils.fixListImage(wechat, "qrcode,logo");
            cashconfig = json.data;
            this.wechat = wechat;

            let types = json.data.types;
            if (!types || types.length < 1) {
              this.$toast("系统维护中,提现功能暂不可用");
            } else {
              let picker = [];
              if (
                (types.indexOf("wechat") > -1 ||
                types.indexOf("wechatpack") > -1 ||
                types.indexOf("wechatminipack") > -1) &&
                wechat && wechat.id
              ) {
                picker.push({ title: "微信零钱", type: "wechat" });
                if (types.indexOf("wechat") < 0) {
                  this.ispack = true;
                  this.wechatlimit =
                    "微信提现每次额度200，每日额度1000，10次以内";
                } else {
                  this.wechatlimit = "";
                }
              }
              if (types.indexOf("alipay") > -1) {
                picker.push({ title: "支付宝余额", type: "alipay" });
              }
              if (types.indexOf("unioncard") > -1) {
                picker.push({ title: "银行卡", type: "unioncard" });
              }
              
              let cashtip = "";
              if (cashconfig.cashdesc) {
                cashtip = cashconfig.cashdesc;
              } else {
                if (cashconfig.fee) {
                  cashtip += "提现手续费：" + cashconfig.fee + "% ";
                  if (cashconfig.fee_min) {
                    cashtip += "最低 " + cashconfig.fee_min + "元 ";
                  }
                  if (cashconfig.fee_max) {
                    cashtip += "封顶 " + cashconfig.fee_max + "元 ";
                  }
                }
                if (cashconfig.limit > 0 || cashconfig.max > 0 || cashconfig.power > 0) {
                  if (cashtip) cashtip += "<br />";
                  cashtip += "单次提现金额: ";
                  if (cashconfig.limit > 0) {
                    cashtip += "最低 " + cashconfig.limit;
                  }
                  if (cashconfig.max > 0) {
                    cashtip += "最高 " + cashconfig.max;
                  }
                  if (cashconfig.power > 0) {
                    cashtip += " 金额必须是 " + cashconfig.power + " 的整数倍";
                  }
                }
              }

              this.cashtip = cashtip;
              this.picker = picker;
              this.cashtype = picker[0].type;
              this.cashtitle = picker[0].title;

              this.checkState();
              this.$watch('formdata', this.checkState, {
                deep: true
              })
            }
          }
        })
        .catch(err => {
          this.$toast.fail(err.msg || "系统错误，请稍候再试");
          this.$router.back();
        });
    },
    loadCard() {
      let loading = this.$toast.loading();
      this.$api.post("member.account/cards").then(json => {
        if (json.code == 1) {
          let cards = json.data.cards;
          cards.push({
            id: 0,
            bank: "新建银行卡资料"
          });
          this.cards = cards.map(item => {
            let desc = item.bank;
            if (item.cardno) {
              desc += "(" + utils.maskString(desc.cardno, 6) + ")";
            }
            item.desc = desc;
            return item;
          });
          this.banklist = json.data.banklist || [];
          loading.close();
          this.checkState();
        } else {
          this.$toast.fail("加载数据错误");
        }
      });
    },
    onCardConfirm(card) {
      this.formdata.card_id = card.id;
      this.showCards = false;
      this.carddesc = card.desc;
      this.checkState();
    },
    onBankConfirm(idx) {
      this.formdata.bank = idx;
      this.showBanks = false;
    },
    checkState() {
      //console.log('checkstate')
      this.enabled = false;
      this.tiptext = '';
      this.amounttip = ''

      clearTimeout(amount_set_delay);
      if (!this.amount) {
        this.tiptext = "请填写提现金额";
        return false;
      }

      let amount = parseFloat(this.amount);
      if (amount < 0 || isNaN(amount)) {
        this.amounttip = "金额不合法";
        return false;
      }
      
      let amounttip = "";
      
      if (cashconfig.limit > 0 && amount < cashconfig.limit) {
        amounttip = "最低提现金额: " + cashconfig.limit;
        amount = cashconfig.limit;
      }
      if (cashconfig.max > 0 && amount > cashconfig.max) {
        amounttip = "最高提现金额: " + cashconfig.max;
        amount = config.max;
      }
      if (cashconfig.power > 0 && amount % cashconfig.power != 0) {
        amounttip = "提现金额必须是 " + cashconfig.power + " 的整数倍";
        amount = Math.ceil(amount / cashconfig.power) * cashconfig.power;
      }
      if (amounttip) {
        this.amounttip = amounttip
        return false;
      }
      if (amount*100 > this.balance) {
        this.amounttip = "可提现余额不足";
        return false;
      }
      
      if (this.cashtype == "wechat") {
        if (!this.realname) {
          this.tiptext = "请填写真实姓名";
          return false;
        }
        if (!this.wechat.is_follow) {
          this.tiptext = "请点击二维码关注服务号";
          return false;
        }
      } else if (this.cashtype == "alipay") {
        if (!this.formdata.alipay) {
          this.tiptext = "请填写支付宝账号";
          return false;
        }
      } else if (this.cashtype == "unioncard") {
        if (this.formdata.card_id == 0) {
          if (
            !this.formdata.bankname ||
            !this.formdata.cardname ||
            !this.formdata.cardno
          ) {
            this.tiptext = "请填写银行卡资料";
            return false;
          }
        }
      }

      this.enabled = true;
    },
    showqrcode() {
      if (config.isWechat) {
        this.$api.wechatReady(wx => {
          wx.previewImage({
            urls: [this.wechat.qrcode]
          });
        });
      } else {
        ImagePreview([this.wechat.qrcode]);
      }
    },
    submitForm() {
      if (this.loading) return;
      this.islading = true;

      let data = this.formdata;
      data.cashtype = this.cashtype;
      data.openid = this.wechat.openid;
      data.amount = this.amount;
      this.$api.post("member.account/cash", data).then(json => {
        if (json.code == 1) {
          this.$toast.success(json.msg);
          this.$router.back();
        }
      }).catch(err=>{
        this.loading = false;

          this.$toast.fail(err.msg || '提现失败');
      });
    }
  }
};
</script>