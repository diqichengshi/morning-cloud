package com.posp.ui.entity;

import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import lombok.Data;

/**
 * 下拉选择框传输数据格式
 *
 * @version        v1.0.1, 2018/09/09 11:19:20 下午
 * @author         gaofeng
 */
@Data
public class SelectTreeDTO {

    /**
     * 下拉框选中节点使用的值
     */
    String value;

    /**
     * 下拉框展示的名称
     */
    String name;

    /**
     * 是否选中
     */
    boolean selected;

    /**
     * 子节点
     */
    List<SelectTreeDTO> children;

    @Override
    public String toString() {
        return JSON.toJSONString(this,
                                 new SerializerFeature[] {
            SerializerFeature.WriteMapNullValue, SerializerFeature.WriteNullListAsEmpty,
            SerializerFeature.WriteNullStringAsEmpty, SerializerFeature.WriteNullNumberAsZero,
            SerializerFeature.WriteNullBooleanAsFalse, SerializerFeature.UseISO8601DateFormat
        });
    }
}
