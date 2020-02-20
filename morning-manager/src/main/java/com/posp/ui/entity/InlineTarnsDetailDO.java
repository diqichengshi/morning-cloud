package com.posp.ui.entity;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 线上交易流水表表结构类
 *
 * @date 2019/09/01 15:18:19
 * @author admin
 */
@Data
public class InlineTarnsDetailDO {

    /**
     *
     */
    String otherOrderNo;

    /**
     * 代理商组织关系
     */
    String agentOrganization;

    /**
     *
     */
    String channelSettleDate;

    /**
     * 交易通知推送次数
     */
    Long noticeCount;

    /**
     * 订单金额
     */
    BigDecimal orderAmt;

    /**
     *
     */
    String id;

    /**
     * 交易码
     */
    String transCode;

    /**
     * 卡号
     */
    String cardNo;

    /**
     * 卡bin表id
     */
    String cardId;

    /**
     * 卡类型：0:借记卡，1:信用卡
     */
    String cardType;

    /**
     * 卡有效期，格式：YYMM
     */
    String cardExpDate;

    /**
     * 交易金额
     */
    BigDecimal amount;

    /**
     * 交易日期时间，格式：MMDDHHMMSS
     */
    String transmitTime;

    /**
     * 交易日期，格式：YYYYMMDD
     */
    String transDate;

    /**
     * 交易时间，格式：hhmmss
     */
    String transTime;

    /**
     * 系统流水号
     */
    String sysTrace;

    /**
     * 逻辑日期，表明批次，日切时+1
     */
    String logicDate;

    /**
     * 交易清算日期
     */
    String settleDate;

    /**
     * 商户号
     */
    String merchId;

    /**
     * 终端号
     */
    String termId;

    /**
     * 终端序列号
     */
    String termSn;

    /**
     * 终端流水号
     */
    String traceNo;

    /**
     * 参考号
     */
    String rrn;

    /**
     * 商户类别码
     */
    String mcc;

    /**
     * 收单机构号,下游机构号(同代理商id)，否则8个0
     */
    String acqId;

    /**
     * 代理商id
     */
    String agentId;

    /**
     * 渠道id
     */
    String channelId;

    /**
     * 渠道商户号
     */
    String channelMerchId;

    /**
     * 渠道终端号
     */
    String channelTermId;

    /**
     * 渠道终端sn序列号
     */
    String channelTermSn;

    /**
     * 渠道商户类别码
     */
    String channelMcc;

    /**
     * 交易属性：000:其他，001:京东，002:微信，003:支付宝，004:银联二维码
     */
    String transType;

    /**
     * 有效标志：0:正常，1:已撤销，2:已冲正，3:已调账
     */
    String validFlag;

    /**
     * 对账标识: N:未对账，Y：对平，S：短款，L：长款
     */
    String checkFlag;

    /**
     * 清算标志：N:未清算，B:不清算,Y:已清算
     */
    String settleFlag;

    /**
     * 批次号
     */
    String batchNo;

    /**
     * 已退金额
     */
    BigDecimal refundAmt;

    /**
     * 商户T1手续费
     */
    BigDecimal fee;

    /**
     * 手续费计算标志：N：未计算手续费，M:已计算手续费，未计算分润，Y：已计算分润
     */
    String feeFlag;

    /**
     * 商户手续费描述，要求包含费率，封顶值
     */
    String feeDesc;

    /**
     * 应答码
     */
    String respCode;

    /**
     * 银联返回码
     */
    String istrespCode;

    /**
     * 应答描述，记录失败的具体信息(原文本日志记录的内容)
     */
    String respDesc;

    /**
     * 应答机构
     */
    String respId;

    /**
     * 商户订单号
     */
    String merchOrderNo;

    /**
     * 二维码订单号
     */
    String orderNo;

    /**
     * 二维码url
     */
    String orderUrl;

    /**
     * 手机号
     */
    String mobile;

    /**
     * 姓名
     */
    String accountName;

    /**
     * 身份证号
     */
    String certNo;

    /**
     * 结算单号,同一天同商户的记录，结算单号一致，格式：YYYYMMDDHHMMSS+4位毫秒
     */
    String settleOrderId;

    /**
     * 原交易的rrn
     */
    String oRrn;

    /**
     * 原交易的日期时间，格式：YYYYMMDD
     */
    String oTransDate;

    /**
     * 记录日期
     */
    Date createTime;

    /**
     * 修改日期
     */
    Date lastModTime;

    /**
     * 渠道手续费
     */
    BigDecimal channelFee;

    /**
     * 费率类型
     */
    String feeType;

    /**
     * 用户标识
     */
    String userCode;

    /**
     * 卡号密文
     */
    String cardNoEncrypt;

    /**
     * 手机号密文
     */
    String mobileEncrypt;

    /**
     * 身份证密文
     */
    String certNoEncrypt;

    /**
     * 秘钥名称
     */
    String keyName;

    /**
     * 银联二维码系统跟踪号
     */
    String settleSysTrace;

    /**
     * 银联二维码交易传输时间
     */
    String settleTransTime;

    /**
     * 查询次数
     */
    Long queryCount;

    /**
     * 支付结果推送标志：0-未推送，1-已推送
     */
    String noticeFlag;

    /**
     * APP二维码支付结果通知推送地址
     */
    String callbackUrl;

    /**
     * 交易通知推送状态：0 - 推送失败，1 - 推送成功
     */
    String noticeStatus;


    @Override
    public String toString() {
        return JSON.toJSONString(this,
                                 new SerializerFeature[] {
            SerializerFeature.WriteMapNullValue, SerializerFeature.WriteNullListAsEmpty,
            SerializerFeature.WriteNullStringAsEmpty, SerializerFeature.WriteNullNumberAsZero,
            SerializerFeature.WriteNullBooleanAsFalse, SerializerFeature.UseISO8601DateFormat
        });
    }
}
