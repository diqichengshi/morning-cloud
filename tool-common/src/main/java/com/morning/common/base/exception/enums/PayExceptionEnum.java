package com.morning.common.base.exception.enums;

import com.morning.common.base.exception.AbstractBaseExceptionEnum;

public enum PayExceptionEnum implements AbstractBaseExceptionEnum {
    ORDER_NOT_EXIST("500501", "支付订单不存在"),
    ORDER_STATUS_ERROR("500502", "支付订单状态错误"),
    ORDER_DEAL_ERROR("500504", "支付中心下单处理失败"),
    CREATE_ORDER_ERROR("500505", "支付中心创建支付订单失败"),
    NOT_SUPPORT_CHANNEL("500506", "不支持的支付渠道类型"),
    MCH_NOT_EXIST("00507", "商户不存在"),
    MCH_STATE_ERROR("500508", "商户状态不正确"),
    MCH_CHANNEL_NOT_EXIST("500507", "商户不存在"),
    MCH_CHANNEL_STATE_ERROR("500510", "商户所属渠道状态不正确"),
    MCH_CHANNEL_ERROR("500507", "商户不存在"),
    MCH_SIGN_ERROR("500511", "商户所属渠道错误");

    private String code;

    private String message;

    PayExceptionEnum(String code, String message) {
        this.code = code;
        this.message = message;
    }
    @Override
    public String getCode() {
        return code;
    }

    @Override
    public String getMessage() {
        return message;
    }
}
