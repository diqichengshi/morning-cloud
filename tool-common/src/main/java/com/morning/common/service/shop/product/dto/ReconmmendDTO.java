package com.morning.common.service.shop.product.dto;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import lombok.Data;

@Data
public class ReconmmendDTO {
    /**
     * Id
     */
    private String id;
    /**
     * 商品Id
     */
    private String productId;
    /**
     * 名称
     */
    private String title;
    /**
     * 图片
     */
    private String showImg;
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
