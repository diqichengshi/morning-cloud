package com.morning.common.constant.enums;

public enum  HttpMethodEnum {
    GET("get", "get"),
    POST("post", "post"),
    DELETE("delete", "delete"),
    PUT("put", "put");

    private String code;
    private String desc;

    HttpMethodEnum(String code, String desc) {
        this.code = code      ;
        this.desc = desc;
    }

    public String getCode() {
        return code;
    }
}
