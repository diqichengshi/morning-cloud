package com.morning.common.service.shop.product.dto;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import lombok.Data;

import java.util.List;

@Data
public class ConmmentDTO {

    /**
     * 商品ID
     */
    private Long productId;

    /**
     * 好评数
     */
    private Integer totalCount;

    /**
     * 好评数
     */
    private Integer goodCount;

    /**
     * 好评数
     */
    private Integer middleCount;

    /**
     * 差评数
     */
    private Integer badCount;

    /**
     * 评论列表
     */
    List<ConmmentDetailDTO> conmmentList;

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
