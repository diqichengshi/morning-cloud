package com.morning.common.service.shop.product.dto;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import lombok.Data;

@Data
public class ConmmentDetailDTO {
    /**
     * 商户号
     */
    private String productId;
    /**
     * 规格名称
     */
    private String userId;
    /**
     * 用户名
     */
    private String userName;
    /**
     * 用户头像
     */
    private String headImg;
    /**
     * 评论星级：1,2,3,4,5
     */
    private Integer star;

    /**
     * 评论内容
     */
    private String content;
    /**
     * 规格参数Id
     */
    private String specParamId;
    /**
     * 购买类型
     */
    private String buyType;

    /**
     * 创建时间
     */
    private String createTime;


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
