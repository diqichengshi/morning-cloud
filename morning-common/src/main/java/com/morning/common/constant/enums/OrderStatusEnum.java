package com.morning.common.constant.enums;

public enum OrderStatusEnum {

    SUBMIT_ORDERS(1, "订单提交"),
    PAY_TO_COMPLETE(2, "支付完成"),
    PICKING(3, "拣取配货"),
    OUTBOUND_GOODS(4, "商品出库"),
    WAITS_FOR_DELIVERY(5, "等待收货"),
    TAKE_DELIVERY(6, "确认收货"),
    AUTOMATICALLY_CANCEL_THE_ORDER(11, "自动取消订单"),
    MANUALLY_CANCEL_THE_ORDER(12, "手动取消订单");

    private Integer status;
    private String desc;

    OrderStatusEnum(Integer status, String desc) {
        this.status = status      ;
        this.desc = desc;
    }

    public Integer getStatus() {
        return status;
    }
}
