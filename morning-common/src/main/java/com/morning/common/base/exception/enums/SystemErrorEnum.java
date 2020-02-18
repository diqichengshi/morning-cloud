package com.morning.common.base.exception.enums;

import com.morning.common.base.exception.AbstractBaseExceptionEnum;

public enum SystemErrorEnum implements AbstractBaseExceptionEnum {

    SYSTEM_OK(000000, "成功"),
    SYSTEM_INNER_ERROR(500102, "服务器内部错误"),
    SYSTEM_TIMEOUT_ERROR(500103, "服务器超时"),
    SYSTEM_VALIDATED_ERROR(500108, "参数验证错误"),
    SYSTEM_BUSINESS_ERROR(500109, "业务异常"),
    GATEWAY_TIMEOUT_ERROR(500110, "网关超时");

    private Integer code;

    private String message;

    SystemErrorEnum(int code, String message) {
        this.code = code;
        this.message = message;
    }
    @Override
    public Integer getCode() {
        return code;
    }

    @Override
    public String getMessage() {
        return message;
    }
}
