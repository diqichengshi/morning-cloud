package com.morning.common.service.shop.product.dto;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * Created by 赵娟 on 2019/3/28.
 * 描述: 商品列表
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
public class ProductDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 商品ID
     */
    private String productId;

    /**
     * 商品名称
     */
    private String name;

    /**
     * 总库存
     */
    private String stock;

    /**
     * 显示价格
     */
    private BigDecimal showPrice;
    /**
     * 评论数量
     */
    private BigDecimal commentNumber;
    /**
     * 展示图片
     */
    private String bigImg;

    /**
     * 店铺名称
     */
    private String shopName;

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
