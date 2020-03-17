package com.morning.common.service.shop.product.entity;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 项目名称：morning-product-facade
 * 类名称：Kind
 * 类描述：Kind / 规格表 实体类
 * 创建人：赵娟娟
 * 创建时间：2017年4月14日 上午2:00:15
 */
@TableName("os_kind")
@Data
public class Kind {

    private static final long serialVersionUID = 1L;
    /**
     * 规格ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 规格ID
     */
    @TableField(value = "kind_id")
    private String kindId;
    /**
     * 商品ID
     */
    @TableField("product_id")
    private Long productId;
    /**
     * 类型
     */
    private String type;
    /**
     * 分类名称
     */
    private String name;
    /**
     * 展示图片
     */
    @TableField("pic_img")
    private String picImg;
    /**
     * 显示价格
     */
    @TableField("show_price")
    private BigDecimal showPrice;
    /**
     * 状态：1.显示；0.隐藏
     */
    private Integer status;
    /**
     * 排序
     */
    private Integer sort;
    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;
    /**
     * 创建者
     */
    @TableField("create_by")
    private String createBy;
    /**
     * 更新时间
     */
    @TableField("update_time")
    private Date updateTime;
    /**
     * 更新者
     */
    @TableField("update_by")
    private String updateBy;

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
