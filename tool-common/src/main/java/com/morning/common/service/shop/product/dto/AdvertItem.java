package com.morning.common.service.shop.product.dto;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.morning.common.service.shop.product.entity.AdvertDO;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 赵娟 on 2019/3/28.
 * 描述: 商品列表
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
public class AdvertItem implements Serializable {

    private static final long serialVersionUID = 1L;

    private AdvertDO bigAdvert;

    List<AdvertDO> itemFour;

    List<AdvertDO> itemContent;

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
