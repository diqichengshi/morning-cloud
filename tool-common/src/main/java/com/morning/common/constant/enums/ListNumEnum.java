package com.morning.common.constant.enums;

public enum ListNumEnum {

    DEFAULT_LIST_OFFSET(1, "默认开始页码"),
    COMMENT_LIMIT(6, "商品评论列表数量"),
    PRODUCT_LIMIT(24, "商品列表数量"),
    HOT_PRODUCT_LIMIT(6, "热销商品列表数量"),
    NICE_PRODUCT_LIMIT(6, "精选商品列表数量"),
    SECKILL_PRODUCT_LIMIT(5, "精选商品列表数量"),
    RECOMMEND_PRODUCT_LIMIT(8, "推荐商品列表数量");

    private Integer num;
    private String desc;

    ListNumEnum(Integer num, String desc) {
        this.num = num;
        this.desc = desc;
    }

    public Integer getNum() {
        return num;
    }

    public String getDesc() {
        return desc;
    }
}
