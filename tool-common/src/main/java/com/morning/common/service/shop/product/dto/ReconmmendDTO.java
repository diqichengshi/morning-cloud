package com.morning.common.service.shop.product.dto;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import lombok.Data;

@Data
public class ReconmmendDTO {
    /**
     * 推荐Id
     */
    private String recommendId;
    /**
     * 商品Id
     */
    private String productId;
    /**
     * 名称
     */
    private String name;
    /**
     * 图片
     */
    private String picImg;
    /**
     * 显示价格
     */
    private Integer showPrice;

    @Override
    public String toString() {
        return JSON.toJSONString(this,
                new SerializerFeature[]{
                        SerializerFeature.WriteMapNullValue, SerializerFeature.WriteNullListAsEmpty,
                        SerializerFeature.WriteNullStringAsEmpty, SerializerFeature.WriteNullNumberAsZero,
                        SerializerFeature.WriteNullBooleanAsFalse, SerializerFeature.UseISO8601DateFormat
                });
    }
}
