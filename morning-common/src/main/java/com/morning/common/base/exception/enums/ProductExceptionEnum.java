package com.morning.common.base.exception.enums;

import com.morning.common.base.exception.AbstractBaseExceptionEnum;

public enum ProductExceptionEnum implements AbstractBaseExceptionEnum {
    PRODUCT_NOT_EXIST(500100, "商品不存在"),
    ORDER_NOT_EXIST(500400, "订单不存在"),
    CART_NOT_EXIST(500402, "商品在购物车中不存在"),
    ADDRESS_NOT_EXIST(500108, "请选择正确的收货地址"),
    ADD_CARD_ERROR(500403, "添加购物车失败"),
    CARD_LIST_ERROR(500404, "查询购物车购物车列表失败"),
    CREATE_ORDER_ERROR(500405, "创建订单失败");

    private Integer code;

    private String message;

    ProductExceptionEnum(int code, String message) {
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
