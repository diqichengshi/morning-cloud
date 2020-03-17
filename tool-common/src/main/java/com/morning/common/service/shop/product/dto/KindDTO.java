package com.morning.common.service.shop.product.dto;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class KindDTO {
    /**
     * 分类Id
     */
    private String kindId;
    /**
     * 分类名称
     */
    private String kindName;
    /**
     * 展示图片
     */
    private String picImg;
    /**
     * 显示价格
     */
    private BigDecimal showPrice;
    
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
