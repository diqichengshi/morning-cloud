package com.morning.common.service.shop.product.dto;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 赵娟 on 2019/3/28.
 * 描述: 广告商品列表
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
public class AdvertDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    private String title;
    private List<String> linkList;
    List<AdvertItem> itemList;

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
