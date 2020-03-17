package com.morning.common.service.shop.product.entity;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：Label   
* 类描述：Label / 商品标签表 实体类   
* 创建人：赵娟娟
* 创建时间：2017年4月11日 下午3:10:45   
*
 */
@TableName("os_label")
@Data
public class Label implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 标签ID
     */
	@TableId(value="label_id", type= IdType.AUTO)
	private String labelId;
    /**
     * 标签名称
     */
	@TableField("label_name")
	private String labelName;
    /**
     * 状态：1.显示；0.隐藏
     */
	private Integer status;
    /**
     * 权限排序
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
    /**
     * 备注
     */
	private String remarks;

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
