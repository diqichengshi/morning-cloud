package com.morning.common.base.exception.enums;

import com.morning.common.base.exception.AbstractBaseExceptionEnum;

public enum SystemErrorEnum implements AbstractBaseExceptionEnum {

    SYSTEM_OK("00", "成功"),
    SYSTEM_INNER_ERROR("10", "服务器内部错误"),
    SYSTEM_TIMEOUT_ERROR("20", "服务器超时"),
    SYSTEM_VALIDATED_ERROR("30", "参数验证错误"),
    SYSTEM_BUSINESS_ERROR("40", "业务异常"),
    GATEWAY_TIMEOUT_ERROR("50", "服务不可用");

    private String code;

    private String message;

    SystemErrorEnum(String code, String message) {
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
