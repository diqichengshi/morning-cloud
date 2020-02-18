package com.morning.common.service.shop.product.dto;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 赵娟 on 2019/3/28.
 * 描述: 商品列表
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
public class SeckillDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    private String seckillsHours;

    private String seckillsMinutes;

    private String seckillsSeconds;

    private List<ProductDTO> productList;


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
