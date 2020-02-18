package com.morning.common.constant.enums;

public enum CategoryTypeEnum {
    ALL(0, "总目录"),
    FIRST(1, "一级目录"),
    SECOND(2, "二级目录"),
    THREE(3, "三级目录");

    private Integer type;
    private String desc;

    CategoryTypeEnum(Integer type, String desc) {
        this.type = type;
        this.desc = desc;
    }

    public Integer getType() {
        return type;
    }
}
