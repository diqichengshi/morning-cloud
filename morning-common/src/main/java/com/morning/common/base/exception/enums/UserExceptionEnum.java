package com.morning.common.base.exception.enums;

import com.morning.common.base.exception.AbstractBaseExceptionEnum;

public enum UserExceptionEnum implements AbstractBaseExceptionEnum {

    LOGIN_NOT_LOGIN_OR_TIMEOUT(500210, "您未登录或者登录已超时"),
    LOGIN_PASSWORD_EMPTY(500211, "登录密码不能为空"),
    LOGIN_MOBILE_EMPTY(500212, "手机号不能为空"),
    LOGIN_MOBILE_ERROR(500213, "手机号格式错误"),
    LOGIN_MOBILE_NOT_EXIST(500214, "手机号不存在"),
    LOGIN_USERNAME_PASSWORD_ERROR(500215, "用户名或密码错误"),
    LOGIN_USER_NO_LOGIN(500216, "用户未登录"),
    LOGIN_WRONG_PASSWORD(500217, "您输入的密码不正确"),
    LOGIN_ACCOUNT_LOCK(5002158, "密码连续输入错误超过5次，锁定半小时!"),
    LOGIN_REGISTER_CODE_ERROR(500219, "验证码错误"),
    LOGIN_ENTERED_PASSWORDS_DIFFER(500220, "两次输入的密码不一致"),
    LOGIN_ACCOUNT_ERROR(500222, "该用户名已被使用"),
    LOGIN_REGISTER_PHONE_REPEAT(500212, "手机号不能为空"),
    LOGIN_REGISTER_EMAIL_REPEAT(500224, "该电子邮箱已被注册了");

    private Integer code;

    private String message;

    UserExceptionEnum(int code, String message) {
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
