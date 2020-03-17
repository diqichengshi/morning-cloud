package com.morning.common.constant.enums;

public enum ShowNumEnum {
    PRODUCT_PICIMG(6, "商品详情展示图片数量"),
    CATEGORY_RECOMMEND_PRODUCT(8, "分类推荐显示产品数量"),
    CATEGORY_RECOMMEND_ADVERT(2, "类目广告显示数量"),
    CATEGORY_NAV_PRODUCT(24, "分类推荐显示产品数量"),
    CATEGORY_NAV_NUMBER(10, "导航栏分类显示数量"),
    CATEGORY_TOP_NUMBER(3, "首页分类显示数量"),
    CATEGORY_PRODUCT_NUMBER(8, "首页分类产品显示数量");

    private Integer num;
    private String desc;

    ShowNumEnum(Integer num, String desc) {
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
