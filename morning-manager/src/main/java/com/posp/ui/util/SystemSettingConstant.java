package com.posp.ui.util;

import java.math.BigDecimal;

/**
 * 系统设置常量
 * @author Warmsheep
 *
 */
public class SystemSettingConstant {
	/**
	 * 邮箱设置
	 */
	public static final String EMAIL_HOST = "email.host";
	public static final String EMAIL_PORT = "email.port";
	public static final String EMAIL_USERNAME = "email.username";
	public static final String EMAIL_PASSWORD = "email.password";
	public static final String EMAIL_TIMEOUT = "email.timeout";
	public static final String EMAIL_AUTH = "email.auth";
	public static final String EMAIL_SEND_FROM_NAME = "email.sendFromName";
	/**
	 * 短信设置
	 */
	public static final String SMS_HOST = "sms.host";
	public static final String SMS_PORT = "sms.port";
	public static final String SMS_USERNAME = "sms.username";
	public static final String SMS_PASSWORD = "sms.password";
	public static final String SMS_TIMEOUT = "sms.timeout";
	public static final String SMS_KEY = "sms.key";
	/**
	 * 交易设置
	 */
	public static final String TRANS_REALTIME_SETT_EXPRITIME = "trans.realtimeSettExpriTime";
	public static final String TRANS_ORDINARY_SETT_EXPRITIME = "trans.ordinarySettExpriTime";
	public static final String TRANS_REMITRATE = "trans.remitRate";
	public static final String TRANS_REMITCAPAMT = "trans.remitCapAmt";
	public static final String TRANS_REMITLOWEST = "trans.remitLowest";
	public static final String TRANS_COMMENHOLIDAY_REMITRATE = "trans.commenHolidayRemitRate";
	public static final String TRANS_LEGALHOLIDAY_REMITRATE = "trans.legalHolidayRemitRate";
	/**
	 * 终端设置
	 */
	public static final String TERMINAL_MAXAPPLY = "terminal.maxApply";
	public static final String TERMINAL_DEFAULTKEYID = "terminal.defaultKeyId";
	/**
	 * 用户设置
	 */
	public static final String USER_LOGINPASSWORD_MERCHANT = "user.loginPasswordMerchant";
	public static final String USER_LOGINPASSWORD_AGENT = "user.loginPasswordAgent";
	public static final String USER_MAXWRONGLOGINPASSWORD = "user.maxWrongLoginPassword";
	public static final String USER_MAXWRONGPAYPASSWORD = "user.maxWrongPayPassword";
	public static final String USER_TIMEOUT_PWD_LOGIN = "user.timeoutPwdLogin";
	public static final String USER_TIMEOUT_PWD_PAY = "user.timeoutPwdPay";
	public static final String USER_SYS_ORGCODE = "user.sysOrgCode";
	public static final String USER_SYS_PROVINCE = "user.sysProvince";
	public static final String USER_SYS_CITY = "user.sysCity";
	public static final String USER_SYS_ADDRESS = "user.sysAddress";
	public static final String USER_TIMEOUT_LOGIN = "user.timeOutLogin";
	
	/**
	 * 系统设置
	 */
	public static final String SYSTEM_RUNTIME = "sys.runtime";
	
	/**
	 * 无效值
	 */
	public static final String STATUS_INVALID = "0";
	
	/**
	 * 有效值
	 */
	public static final String STATUS_VALID = "1";
	/**
	 * 注销值
	 */
	public static final String STATUS_CANCLE = "X";
	
	/**
	 * 银行查询类型
	 * province:查询银行所属省
	 * city:查询银行所属市
	 * bank:查询银行支行名称
	 */
	public static final String BANK_QUERY_PROVINCE = "province";
	public static final String BANK_QUERY_CITY = "city";
	public static final String BANK_QUERY_BANK = "bank";
	
	/**
	 * 清算类型 0:平台清算，1:手工提现，2:无需清算
	 */
	public static final String SETTLE_TYPE_SOFTWARE = "0";
	public static final String SETTLE_TYPE_ARTIFICIAL  = "1";
	public static final String SETTLE_TYPE_NULL = "2";
	
	/**
	 * 结算方式：0:日结，1:周结，2:月结
	 */
	public static final String SETTLE_MODE_DAY = "0";
	public static final String SETTLE_MODE_WEEK = "1";
	public static final String SETTLE_MODE_MONTH = "2";
	
	/**
	 * 结算周期：当settle_type为0时(日结)：0-23；为1时(周结):1-7；为2时(月结):1-31
	 */
	public static final String SETTLE_DATE_DAY = "0";
	public static final String SETTLE_DATE_WEEK = "1";
	public static final String SETTLE_DATE_MONTH = "2";
	
	/**
	 * 费率类型：00：境内标准借记卡；Y0:境内优惠借记卡；M0:境内减免借记卡；A0:境外借记卡；01:境内标准信用卡；
	 * Y1:境内优惠信用卡；M1:境内减免信用卡；A1:境外信用卡；D0:提现；WX:微信；BB:支付宝
	 */
	public static final String FEE_TYPE_JNB = "00";
	public static final String FEE_TYPE_JNY = "Y0";
	public static final String FEE_TYPE_JNJ = "M0";
	public static final String FEE_TYPE_JWJ = "A0";
	public static final String FEE_TYPE_JNBX = "01";
	public static final String FEE_TYPE_JNYX = "Y1";
	public static final String FEE_TYPE_JNJX = "M1";
	public static final String FEE_TYPE_JWX = "A1";
	public static final String FEE_TYPE_TX = "D0";
	public static final String FEE_TYPE_WX = "WX";
	public static final String FEE_TYPE_BB = "BB";
	
	/**
	 * 账户性质:S:对私，G:对公
	 */
	public static final String ACCOUNT_TYPE_S = "S";
	public static final String ACCOUNT_TYPE_G = "G";
	
	/**
	 * 证件类型：01:身份证，02:军官证，03:护照，04:港澳居民来往内地通行证(回乡证),05:台湾同胞来往内地通行证,06:警官证,
	 * 07:士兵证,08:户口薄，09:临时身份证，10:外国人居留证，00:其他证件
	 */
	public static final String CERT_TYPE_SF = "01";
	public static final String CERT_TYPE_JG = "02";
	public static final String CERT_TYPE_HZ = "03";
	public static final String CERT_TYPE_GO = "04";
	public static final String CERT_TYPE_TW = "05";
	public static final String CERT_TYPE_JI = "06";
	public static final String CERT_TYPE_SO = "07";
	public static final String CERT_TYPE_HK = "08";
	public static final String CERT_TYPE_TS = "09";
	public static final String CERT_TYPE_WG = "10";
	public static final String CERT_TYPE_QT = "00";
	
	/**
	 * 商户拓展方式：1:自主拓展，2:委托外包
	 */
	public static final String EXPAND_TYPE_ZZ = "1";
	public static final String EXPAND_TYPE_WB = "2"; 
	
	/**
	 * 商户接入类型：Z：直连，J：间联
	 */
	public static final String CONN_TYPE_ZL = "Z";
	public static final String CONN_TYPE_JL = "J"; 
	
	/**
	 * 是否在银联报备：0:无，1:有
	 */
	public static final String CUPS_FLAG_WU = "0";
	//public static final String CUPS_FLAG_YO = "1";
	
	/**
	 * 商户类型: 0:标准，1:优惠；2:减免
	 */
	public static final String MERCH_TYPE_B = "0";
	public static final String MERCH_TYPE_Y = "1";
	public static final String MERCH_TYPE_J = "2";
	
	/**
	 * 是否资质核实：0:否，1:是
	 */
	public static final String VERIFY_FLAG_F = "0";
	public static final String VERIFY_FLAG_S = "1";

	/**
	 * 商户风险等级：0:优质，1:正常，2:有一定风险，3:高风险
	 */
	public static final String MERCH_LEVEL_LOW = "0";
	public static final String MERCH_LEVEL_MIDDLE = "1";
	public static final String MERCH_LEVEL_HM = "2";
	public static final String MERCH_LEVEL_HIGH = "3";
	
	/**
	 * 审核操作：0:已提交，1:审核通过，2:已驳回，a:合同签约，b:驳回签约，c:商户签章
	 */
	public static final String AUDIT_OPERATION_COMMIT = "0";
	public static final String AUDIT_OPERATION_PASS = "1";
	public static final String AUDIT_OPERATION_REBUT = "2";
	public static final String AUDIT_OPERATION_SIGN = "a";
	public static final String AUDIT_OPERATION_SIGN_FAIL = "b";
	public static final String AUDIT_OPERATION_SIGNATURE = "c";
	
	/**操作类型,0:增加,1修改资料,2:状态变更,3:删除**/
	public static final String OPT_ADD = "0";
	public static final String OPT_UPDATE= "1";
	public static final String OPT_STATUS = "2";
	public static final String OPT_DELETE= "3";
	
	
	/**(新)历史表操作类型,1:新增(提交),2:审核驳回,3:审核通过**/
	public static final String OPT_TYPE_ADD= "1";
	public static final String OPT_TYPE_REJECT = "2";
	public static final String OPT_TYPE_PASS= "3";
	
	/**
	 * 审核类型：
	 * 	MJ:商户入网审核，MB:商户基本信息审核，MF:商户费率审核、MS商户账户审核
	 * 	AJ:代理商审核
	 *  T:终端一台审核
	 */
	public static final String AUDIT_RESOURCES_MJ = "MJ";
	public static final String AUDIT_RESOURCES_MB = "MB";
	public static final String AUDIT_RESOURCES_MF = "MF";
	public static final String AUDIT_RESOURCES_AJ = "AJ";
	public static final String AUDIT_RESOURCES_T = "T";
	
	/**
	 * 手续费费率数最小值
	 */
	public static final BigDecimal FEE_RATE_MIN = new BigDecimal(0);
	/**
	 * 手续费费率数最大值
	 */
	public static final BigDecimal FEE_RATE_MAX = new BigDecimal(1);
	/**
	 * 返佣比例最小值
	 */
	public static final BigDecimal FEE_RATIO_MIN = new BigDecimal(0);
	/**
	 * 返佣比例最大值
	 */
	public static final BigDecimal FEE_RATIO_MAX = new BigDecimal(100);
	
	/**
	 * 总部机构
	 */
	public static final String GROUP_CODE_HQ = "00000000";
	
	/**
	 * 商户使用费率类型：1:标准，2:优惠，3:减免
	 */
	public static final String MERCH_FEE_TYPE_B = "1";
	public static final String MERCH_FEE_TYPE_Y = "2";
	public static final String MERCH_FEE_TYPE_M = "3";
	
	/**
	 * 终端库存状态：0：闲置库存，1：已装机，2：申领中，X：报废库存
	 */
	public static final String TERMINAL_DEV_LEAVE = "0";
	public static final String TERMINAL_DEV_INSTALL = "1";
	public static final String TERMINAL_DEV_APPLYING = "2";
	public static final String TERMINAL_DEV_SCRAP = "X";
	
	/**
	 * 是否在审核中：0:否，1:是，只要标志为1，禁止任何的修改资料，状态变更等操作。
	 */
	public static final String MERCHANT_AUDITING_CHK_NO = "0";
	public static final String MERCHANT_AUDITING_CHK_YES = "1";
	
	
	/**AG/AGT 代理商查询*/
	public static final String QUERY_TYPE_AG = "AG";
	/**AG/AGT 代理商查询*/
	public static final String QUERY_TYPE_AGT = "AGT";
	/**CP 分公司查询*/
	public static final String QUERY_TYPE_CP = "CP";
	/**HQ 总部查询/运营 */
	public static final String QUERY_TYPE_HQ = "HQ";
	/**LQ 限制规则查询*/
	public static final String QUERY_TYPE_LQ = "LQ";
	/**BQ 结算账户查询*/
	public static final String QUERY_TYPE_BQ = "BQ";
	/**MQ 结算金额查询*/
	public static final String QUERY_TYPE_MQ = "MQ";
	/**AQ 商户调拨*/
	public static final String QUERY_TYPE_AQ = "AQ";
	/**MRQ 商户风控查询,*/
	public static final String QUERY_TYPE_MRQ = "MRQ";
	/**DFQ 商户双免查询*/
	public static final String QUERY_TYPE_DFQ = "DFQ";
	
	/**手续费费率最大值*/
	public static final String FEE_RATE = "FEE_RATE";
	/**手续费费率最小值*/
	public static final String MIN_FEE_RATE = "MIN_FEE_RATE";
	/**单笔提现最大值*/
	public static final String D0_SINGLE_CASH_DRAWAL = "D0_SINGLE_CASH_DRAWAL";
	/**单笔提现最小值*/
	public static final String D0_SINGLE_CASH_DRAWAL_MIN = "D0_SINGLE_CASH_DRAWAL_MIN";
	/**特殊单笔提现最大值*/
	public static final String S_D0_SINGLE_CASH_DRAWAL = "S_D0_SINGLE_CASH_DRAWAL";
	/**特殊单笔提现最小值*/
	public static final String S_D0_SINGLE_CASH_DRAWAL_MIN = "S_D0_SINGLE_CASH_DRAWAL_MIN";
	/**EPOS手续费费率最小值*/
	public static final String E_MIN_FEE_RATE = "E_MIN_FEE_RATE";
	/**EPOS单笔提现最小值*/
	public static final String E_D0_SINGLE_CASH_DRAWAL_MIN = "E_D0_SINGLE_CASH_DRAWAL_MIN";
	//手机验证最大值
	public static final String MOBILE_VALIDATE_MAX = "MOBILE_VALIDATE_MAX";
	//身份证最大值
	public static final String ID_CARD_VALIDATE_MAX = "ID_CARD_VALIDATE_MAX";
	//终端批量录入最大值
	public static final String TERMINALNEW_BATCH_MAX = "TERMINALNEW_BATCH_MAX";
	
	/**-----------手续费--------***/
	
	/**信用卡手续费最小值*/
	public static final String C_FEE_RATE_MIN = "C_FEE_RATE_MIN";//0.55
	/**信用卡手续费最大值 */
	public static final String C_FEE_RATE_MAX = "C_FEE_RATE_MAX" ;//  1
	/**优惠信用卡手续费最小值 */
	public static final String YH_C_FEE_RATE_MIN = "YH_C_FEE_RATE_MIN" ;//  0.45
	/**优惠信用卡手续费最大值 */
	public static final String YH_C_FEE_RATE_MAX = "YH_C_FEE_RATE_MAX" ;//  1
	/**减免信用卡手续费最小值 */
	public static final String JM_C_FEE_RATE_MIN = "JM_C_FEE_RATE_MIN" ;//  0
	/**减免信用卡手续费最大值 */
	public static final String JM_C_FEE_RATE_MAX = "JM_C_FEE_RATE_MAX" ;//  1
	/**借记卡手续费最小值 */
	public static final String D_FEE_RATE_MIN = "D_FEE_RATE_MIN" ;//  0
	/**借记卡手续费最大值 */
	public static final String D_FEE_RATE_MAX = "D_FEE_RATE_MAX" ;//  1
	/**优惠借记卡手续费最小值*/
	public static final String YH_D_FEE_RATE_MIN = "YH_D_FEE_RATE_MIN";//   0
	/**优惠借记卡手续费最大值 */
	public static final String YH_D_FEE_RATE_MAX = "YH_D_FEE_RATE_MAX";//   1
	/**减免借记卡手续费最小值*/
	public static final String JM_D_FEE_RATE_MIN = "JM_D_FEE_RATE_MIN";//   0
	/**减免借记卡手续费最大值 */
	public static final String JM_D_FEE_RATE_MAX = "JM_D_FEE_RATE_MAX";//   1
	

	/**微信二维码最小值 */
	public static final String WX_FEE_RATE_MIN = "WX_FEE_RATE_MIN";//  0.33
	/**微信二维码最大值 */
	public static final String WX_FEE_RATE_MAX = "WX_FEE_RATE_MAX";//  1
	/**优惠微信二维码最小值 */
	public static final String YH_WX_FEE_RATE_MIN = "YH_WX_FEE_RATE_MIN";//  0.33
	/**优惠微信二维码最大值 */
	public static final String YH_WX_FEE_RATE_MAX = "YH_WX_FEE_RATE_MAX";//  1
	/**减免微信二维码最小值 */
	public static final String JM_WX_FEE_RATE_MIN = "JM_WX_FEE_RATE_MIN";//  0.33
	/**减免微信二维码最大值 */
	public static final String JM_WX_FEE_RATE_MAX = "JM_WX_FEE_RATE_MAX";//  1
	/**支付宝二维码最小值 */
	public static final String BB_FEE_RATE_MIN = "BB_FEE_RATE_MIN";//  0.33
	/**支付宝二维码最大值 */
	public static final String BB_FEE_RATE_MAX = "BB_FEE_RATE_MAX";//  1
	/**优惠支付宝二维码最小值 */
	public static final String YH_BB_FEE_RATE_MIN = "YH_BB_FEE_RATE_MIN";//  0.33
	/**优惠支付宝二维码最大值 */
	public static final String YH_BB_FEE_RATE_MAX = "YH_BB_FEE_RATE_MAX";//  1
	/**减免支付宝二维码最小值 */
	public static final String JM_BB_FEE_RATE_MIN = "JM_BB_FEE_RATE_MIN";//  0.33
	/**减免支付宝二维码最大值 */
	public static final String JM_BB_FEE_RATE_MAX = "JM_BB_FEE_RATE_MAX";//  1

	

	/**云闪付信用卡手续费最小值  */
	public static final String YC_FREE_FEE_RATE_MIN = "YC_FREE_FEE_RATE_MIN";//  0.33
	/**云闪付信用卡手续费最大值  */
	public static final String YC_FREE_FEE_RATE_MAX = "YC_FREE_FEE_RATE_MAX";//   1
	/**优惠云闪付信用卡手续费最小值  */
	public static final String YH_YC_FREE_FEE_RATE_MIN = "YH_YC_FREE_FEE_RATE_MIN";//  0.33
	/**优惠云闪付信用卡手续费最大值  */
	public static final String YH_YC_FREE_FEE_RATE_MAX = "YH_YC_FREE_FEE_RATE_MAX";//   1
	/**减免云闪付信用卡手续费最小值  */
	public static final String JM_YC_FREE_FEE_RATE_MIN = "JM_YC_FREE_FEE_RATE_MIN";//  0
	/**减免云闪付信用卡手续费最大值  */
	public static final String JM_YC_FREE_FEE_RATE_MAX = "JM_YC_FREE_FEE_RATE_MAX";//   1
	/**云闪付借记卡手续费最小值  */
	public static final String YD_FREE_FEE_RATE_MIN = "YD_FREE_FEE_RATE_MIN";//   0.33
	/**云闪付借记卡手续费最大值  */
	public static final String YD_FREE_FEE_RATE_MAX = "YD_FREE_FEE_RATE_MAX";//   1
	/**优惠云闪付借记卡手续费最小值  */
	public static final String YH_YD_FREE_FEE_RATE_MIN = "YH_YD_FREE_FEE_RATE_MIN";//   0.33
	/**优惠云闪付借记卡手续费最大值  */
	public static final String YH_YD_FREE_FEE_RATE_MAX = "YH_YD_FREE_FEE_RATE_MAX";//   1
	/**减免云闪付借记卡手续费最小值  */
	public static final String JM_YD_FREE_FEE_RATE_MIN = "JM_YD_FREE_FEE_RATE_MIN";//   0
	/**减免云闪付借记卡手续费最大值  */
	public static final String JM_YD_FREE_FEE_RATE_MAX = "JM_YD_FREE_FEE_RATE_MAX";//   1
	
	/**D0手续费最大值*/
	public static final String D0_FEE_RATE_MAX = "D0_FEE_RATE_MAX";// 0.1
	/**D0手续费最小值 */
	public static final String D0_FEE_RATE_MIN = "D0_FEE_RATE_MIN";// 0
	/**优惠D0手续费最小值 */
	public static final String YH_D0_FEE_RATE_MIN = "YH_D0_FEE_RATE_MIN";//  0
	/**优惠D0手续费最大值 */
	public static final String YH_D0_FEE_RATE_MAX = "YH_D0_FEE_RATE_MAX";// 0.1
	/**减免D0手续费最小值 */
	public static final String JM_D0_FEE_RATE_MIN = "JM_D0_FEE_RATE_MIN";//  0.02
	/**减免D0手续费最大值 */
	public static final String JM_D0_FEE_RATE_MAX = "JM_D0_FEE_RATE_MAX";// 0.1
	/**特殊D0手续费最大值 */
	public static final String S_D0_FEE_RATE_MAX = "S_D0_FEE_RATE_MAX";
	/**特殊D0手续费最小值 */
	public static final String S_D0_FEE_RATE_MIN = "S_D0_FEE_RATE_MIN";
	/**特殊优惠D0手续费最小值 */
	public static final String S_YH_D0_FEE_RATE_MIN = "S_YH_D0_FEE_RATE_MIN";//  0
	/**特殊优惠D0手续费最大值 */
	public static final String S_YH_D0_FEE_RATE_MAX = "S_YH_D0_FEE_RATE_MAX";// 0.1
	/**特殊减免D0手续费最小值 */
	public static final String S_JM_D0_FEE_RATE_MIN = "S_JM_D0_FEE_RATE_MIN";//  0.02
	/**特殊减免D0手续费最大值 */
	public static final String S_JM_D0_FEE_RATE_MAX = "S_JM_D0_FEE_RATE_MAX";// 0.1
	/**快捷借记卡手续费最小值  */
	public static final String DQ_FEE_RATE_MIN = "DQ_FEE_RATE_MIN";
	/**快捷借记卡手续费最大值  */
	public static final String DQ_FEE_RATE_MAX = "DQ_FEE_RATE_MAX";
	/**快捷信用卡手续费最小值  */
	public static final String CQ_FEE_RATE_MIN = "CQ_FEE_RATE_MIN";
	/**快捷信用卡手续费最大值  */
	public static final String CQ_FEE_RATE_MAX = "CQ_FEE_RATE_MAX";

	/**
	 * 终端订单畅捷支付参数KEY
	 * */
	public static final String CHNA_PAY_URL = "CHNA_PAY_URL";
	public static final String CHAN_PAY_SERVICE = "CHAN_PAY_SERVICE";
	public static final String CHAN_PAY_IS_ANONYMOUS = "CHAN_PAY_IS_ANONYMOUS";
	public static final String CHAN_PAY_CHARSET = "CHAN_PAY_CHARSET";
	public static final String CHAN_PAY_VERSION = "CHAN_PAY_VERSION";
	public static final String CHAN_PAY_PARTNER_ID = "CHAN_PAY_PARTNER_ID";
	public static final String CHAN_PAY_METHOD = "CHAN_PAY_METHOD";
	public static final String CHAN_PAY_TYPE = "CHAN_PAY_TYPE";
	public static final String CHAN_PAY_RETURN_URL = "CHAN_PAY_RETURN_URL";
	public static final String CHAN_PAY_NOTIFY_URL = "CHAN_PAY_NOTIFY_URL";
	public static final String CHAN_PAY_EXPIRE_TIME = "CHAN_PAY_EXPIRE_TIME";
	public static final String CHAN_PAY_PRODUCT_NAME = "CHAN_PAY_PRODUCT_NAME";
	public static final String CHAN_PAY_PRIVATE_KEY = "CHAN_PAY_PRIVATE_KEY";
	public static final String CHAN_PAY_PUBLIC_KEY = "CHAN_PAY_PUBLIC_KEY";
	public static final String CHAN_PAY_TRADE_TYPE = "CHAN_PAY_TRADE_TYPE";
	public static final String CHAN_PAY_QUERY_URL = "CHAN_PAY_QUERY_URL";
	public static final String CHNA_PAY_PASS_TYPE = "CHNA_PAY_PASS_TYPE";
	public static final String CHNA_PAY_QUERY_SERVICE = "CHNA_PAY_QUERY_SERVICE";
	public static final String CHAN_PAY_TEST_AMT = "CHAN_PAY_TEST_AMT";
	public static final String CHNA_PAY_ORDER_COUNT = "CHNA_PAY_ORDER_COUNT";
	
	/**
	 * 终端订单状态: 01:待支付 02:支付中(确认中) 03:支付成功 04:支付失败 05:订单取消 06:订单关闭
	 * */
	public static final String TERM_ORDER_WAIT_PAY = "01";
	public static final String TERM_ORDER_PAYING = "02";
	public static final String TERM_ORDER_SUCCESS = "03";
	public static final String TERM_ORDER_FAILURE = "04";
	public static final String TERM_ORDER_CANCEL = "05";
	public static final String TERM_ORDER_CLOSE = "06";
	/**
	 * 终端订单发货标识: 00:否 01:是
	 * */
	public static final String TERM_ORDER_DELIVERY_NO = "00";
	public static final String TERM_ORDER_DELIVERY_YES = "01";
	/**
	 * 终端订单收货标识 00:否 01:是
	 * */
	public static final String TERM_ORDER_ACCEPT_NO = "00";
	public static final String TERM_ORDER_ACCEPT_YES = "01";
	
	//商户user_code种子
	public static final String MERCHANT_USERCODE_SEED = "merchant_usercode";
	
	/**
	 * 生活圈商户状态
	 * */
	public static final String LIFECIRCLE_MERCH_NORMAL = "1";
	public static final String LIFECIRCLE_MERCH_CLOSE = "2";
	public static final String LIFECIRCLE_MERCH_CANCEL = "X";
	public static final String CHANNEL_MERCH_CANCEL = "0";
	/**
	 * 生活圈商户开通状态
	 * */
	public static final String LIFECIRCLE_MERCH_OPENED = "1";
	public static final String LIFECIRCLE_MERCH_NOT_OPEN = "0";
	public static final String LIFECIRCLE_MERCH_AUDIT = "S";
	
	/**
	 * 终端是否支持开通生活圈
	 */
	public static final String TERMINAL_SUPPORT_LIFE_CIRCLE = "1";
	public static final String TERMINAL_NOT_SUPPORT_LIFE_CIRCLE = "0";
	/**
	 * 代理商状态
	 */
	//有效
	public static final String AGENT_STATUS_VALID = "1";
	//无效
	public static final String AGENT_STATUS_NO_VALID = "0";
	
	/**
	 * 生活圈商户图片类型
	 * */
	public static final String LIFECIRLCE_MERCH_IDX_IMG = "01";
		 
	 /**
	 *变更类型 1为修改账户信息 2为修改银行卡信息 3为修改账户+银行卡信息  4修改费率与费用,5 变更代理商号
	 * */
	public static final int CHANGE_ACCOUNT_ONE = 1;
	public static final int CHANGE_ACCOUNT_TWO = 2;
	public static final int CHANGE_ACCOUNT_THREE = 3;
	public static final int CHANGE_FEE_FOUR = 4;
	public static final int CHANGE_AGENT_FIVE = 5;
	
	 /**
	 * mcc类别：0:标准类，1:优惠类，2:减免类，3:特殊计费类
	 * */
	public static final String MCC_TYPE_BZ = "0";
	public static final String MCC_TYPE_YH = "1";
	public static final String MCC_TYPE_JM = "2";
	public static final String MCC_TYPE_TS = "3";
	
	/**
     * 密钥管理 状态:0:无效,1:有效，X：注销
     * */
    public static final String ZMK_STATUS_INVALID = "0";
    public static final String ZMK_STATUS_VALID = "1";
    public static final String ZMK_STATUS_CANCEL = "X";
    
    /**
     * 生活圈代理商总开关
     * */
    public static final String LIFE_AGENT_SWITCH = "LIFE_AGENT_SWITCH";
    public static final String LIFE_AGENT_SWITCH_OPEN = "1";
    public static final String LIFE_AGENT_SWITCH_CLOSE = "0";
    
    /**
     * 用户默认初始登陆密码
     * */
    public static final String USER_RESET_LOGIN_PWD = "USER_RESET_LOGIN_PWD";
    /**
     * 魔方电子序列号长度
     * */
    public static final String MF_SN_LENGTH = "MF_SN_LENGTH";
    /**
     * 魔方电子序列号前缀key
     * */
    public static final String MF_SN_CODE = "MF_PREFIX";
    
    /**
     * 新大陆序列号前缀key
     * */
    public static final String XDL_SN_CODE = "XDL_PREFIX";
    /**
     * 世麦电子列号前缀key
     * */
    public static final String SHM_SN_CODE = "SHM_PREFIX";
    /**
     * 智能果列号前缀key
     * */
    public static final String ZHNG_SN_CODE = "ZHNG_PREFIX";
    /**
     * 新大陆序列号前缀key
     * */
    public static final String XDL_MODEL = "XDL_MODEL";

    /**
     * 调单状态
     * 0:[运营]已创建/[代理商未上传]调取中 
	 * 1:[代理商已上传]已提交 
	 * 2:[运营已确认]已调取/成功 
	 * 3:[运营]废弃
     * */
    public static final String MERCH_RECEIPT_STATUS_CREATE = "0";
    public static final String MERCH_RECEIPT_STATUS_COMMIT = "1";
    public static final String MERCH_RECEIPT_STATUS_CONFIRM = "2";
    public static final String MERCH_RECEIPT_STATUS_ABANDON = "3";
    
    /**
     * 调单类型
     * */
    public static final String MERCH_RECEIPT_TYPE_POS = "1";
    public static final String MERCH_RECEIPT_TYPE_QRCODE = "2";
    
    /**
     * 商户默认登录密码
     * */
    public static final String USER_LOGINPWD_MERCH = "USER_LOGINPWD_MERCH";
    /**
     * 代理商用户默认登录密码
     * */
    public static final String USER_LOGIN_PWD_AGENT = "USER_LOGINPWD_AGENT";
    /**
     * 登录密码过期时间
     * */
    public static final String USER_LOGIN_PWD_VALID_DURATION = "USER_LOGIN_PWD_VALID_DURATION";

    /**
     * 风控规则交易码
     * */
    public static final String RISKRULE_TRANSCODE = "RISKRULE_TRANSCODE";

    /**
     * 修改密码类型
     * 1:重置 2:修改
     * */
    public static final String USER_PWD_TYPE_RESET = "1";
    public static final String USER_PWD_TYPE_MODIFY = "2";
    public static final String USER_PWD_LIST_SIZE = "4";
    public static final String USER_PWD_LIST_FRIST = "1";
    
    /**
     * 虚拟终端状态:0：闲置库存，1：已装机，2：申领中，X：报废库存
     * */
    public static final String TERM_VISUAL_STATUS_UNUSED = "0";
    public static final String TERM_VISUAL_STATUS_USED = "1";
    public static final String TERM_VISUAL_STATUS_APPLYING = "2";
    public static final String TERM_VISUAL_STATUS_ABANDON = "X";
    /**
     * 终端入库类型(0:存量 1:自备机 2:新增)
     * */
    public static final String DEV_TERM_TYPE_STOCK = "0";
    /**
     * 终端入库类型(0:存量 1:自备机 2:新增)
     * */
    public static final String DEV_TERM_TYPE_VISUAL = "1";
    /**终端入库类型: 2 新增机*/
    public static final String DEV_TERM_TYPE_ADD = "2";
    
    /**
     * 双免默认值
     * */
    public static final String TERMQICPARAM_DEFAULT_VALUE = "TERM_QIC_PARAM";
    //状态 (0关闭 1开通)
    public static final String MERCH_DOUBLE_FREE_NORMAL = "1";
    public static final String MERCH_DOUBLE_FREE_CLOSE = "0";
    
    //生活圈商户名称规则
    public static final String LIFE_MERCH_NAME_RULE = "LIFE_MERCH_NAME_RULE";
    
    /**
     * 商户验证
	 * 0:商户名称,1:邮件 ,2:营业执照编号 ,3:法人身份证,4:联系人身份证,5:结算人身份证
	 */
    public static final String VALID_STATUS_MERCH_NAME="0";
    public static final String VALID_STATUS_EMAIL="1";
    public static final String VALID_STATUS_LICENSE_NO="2";
    public static final String VALID_STATUS_LEGAL_CERT_NO="3";
    public static final String VALID_STATUS_CONTACTS_CERT_NO="4";
    public static final String VALID_STATUS_ID_CARD="5";
    public static final String VALID_STATUS_ALL="100";
    
    //商户等级
    public static final String GRADE_MERCH_LEVEL="GRADE_MERCH_LEVEL";
    
    /**
     * 文件动作
	 * cupMerchant:本地商户报备,cupLifeMerchant:生活圈商户报备 ,
	 * cupTerminal:终端报备 ,cupCancelMerchant:本地商户注销报备,cupCancelLifeMerchant:生活圈商户注销报备
	 * posTransHis:POS历史流水,inlineTrans:二维码流水下载,settleTrans:分润下载,profitDay:分润日统计
	 */
    public static final String CUP_MERCHANT="cupMerchant";
    public static final String CUP_LIFE_MERCHANT="cupLifeMerchant";
    public static final String CUP_TERMINAL="cupTerminal";
    public static final String CUP_CANCEL_MERCHANT="cupCancelMerchant";
    public static final String CUP_CANCEL_LIFE_MERCHANT="cupCancelLifeMerchant";
    public static final String POS_HIS_DOWNLOAD="posTransHis";
    public static final String INLINE_DOWNLOAD="inlineTrans";
    public static final String SETTLE_DOWNLOAD="settleTrans";
    public static final String LIFECIRCLEMERCH_DOWNLOAD="lifeCircleMerchant";
    public static final String ACTIVITY_MERCH_DOWNLOAD="activityMerch";
	public static final String PROFIT_DAY_DOWNLOAD="profitDay";
    //渠道商户状态(1启用 0关闭)
    public static final String CHANNEL_MERCH_OPEN = "1";
    public static final String CHANNEL_MERCH_CLOSED = "0";
    
    /**查询交易流水类型*/
    public static final String TRANS_DETAIL_TYPE_NOW="TABLE_NOW";
    public static final String TRANS_DETAIL_TYPE_NEW="VIEW_NEW";
    public static final String TRANS_DETAIL_TYPE_HIS="TABLE_HIS";
    
    /**查询类型:  A:审核  ,D:详情*/
    public static final String MERCH_SEARCH_TYPE_A="A";
    public static final String MERCH_SEARCH_TYPE_D="D";
    
    /**分区表名: PARTITION_POS:POS历史流水表*/
    public static final String PARTITION_POS="B_POS_TRANS_DETAIL_HIS";
    
    /**文件状态 0:装载中，1:装载已完成，2:未装载，3:装载失败*/
    public static final String FILE_STATUS_LOADING="0";
    public static final String FILE_STATUS_FINISHED="1";
    public static final String FILE_STATUS_NOTHING="2";
    public static final String FILE_STATUS_FAILURE="3";
    
    /**
     * 优惠代理商总开关
     * */
    public static final String AGENT_ROUTE_SWITCH = "AGENT_ROUTE_PRIME_SWITCH";
    public static final String AGENT_ROUTE_SWITCH_OPEN = "1";
    public static final String AGENT_ROUTE_SWITCH_CLOSE = "0";
    
    /**
     * 渠道模式路由区域(0本省 1全国)
     * */
    public static final String CHANNEL_GROUP_PROVINCE = "0";
    public static final String CHANNEL_GROUP_NATIONAL = "1";
    /**终端申领限制值*/
    public static final String TERMINAL_APPLY_AUDIT = "TERMINAL_APPLY_AUDIT";
    /**申活圈开通限制值*/
    public static final String LIFECIRCLE_TERMINAL_APPLY_AUDIT = "LIFECIRCLE_TERMINAL_APPLY_AUDIT";
    
    /**MCC双免状态:1允许*/
    public static final String MCC_FREE_FLAG_ALLOWABLE = "1";
    /**商户双免状态:2不允许开通*/
    public static final String MERCH_FREE_FLAG_UNALLOWABLE = "2";

	/**
	 * 交易结算标识 N:未入账，M:已入账,Y:已提现,F:已转账
	 */
	public static final String TRANS_SETTLE_FLAG_N = "N";
	public static final String TRANS_SETTLE_FLAG_M = "M";
	public static final String TRANS_SETTLE_FLAG_Y = "Y";
	public static final String TRANS_SETTLE_FLAG_F = "F";

	/**
	 * 交易钱包类型 0:D0,1:日结消费(D0) 2:D0待审(消费认证)，3:T1钱包,S:D0待审转D0
	 */
	public static final String TRANS_TYPE_DAILY_CONSUMPTION = "1";
	public static final String TRANS_TYPE_D0_AUDIT = "2";
	public static final String TRANS_TYPEY_T1_WALLET = "3";
	public static final String TRANS_TYPE_D0_WALLET = "S";

	/**
	 * D0审核状态 3通过
	 */
	public static final String D0_CHECK_STATUS_PASS = "3";
	
	/**
	 * 商户是否鉴权控制:1鉴权,0,不鉴权
	 */
	public static final String AUTHENTICATION = "AUTHENTICATION";
    
}
