package com.morning.common.service.shop.product.entity;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;

/**
 * Created by 赵娟 on 2019/3/28.
 * 描述: 商品列表
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
public class AdvertDO implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 商品ID
     */
    private String productId;

    /**
     * 商品标题
     */
    private String title;
    /**
     * 商品名称
     */
    private String intro;

    /**
     * 显示价格
     */
    private String picImg;

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
