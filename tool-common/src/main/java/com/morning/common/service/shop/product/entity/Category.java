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
* 类名称：Category   
* 类描述：Category / 分类表 实体类   
* 创建人：赵娟娟
* 创建时间：2017年4月12日 下午4:19:23   
*
 */
@TableName("os_category")
@Data
public class Category  {

    private static final long serialVersionUID = 1L;

    /**
     * 分类ID
     */
	@TableId(value="category_id", type= IdType.AUTO)
	private String categoryId;
    /**
     * 父分类ID
     */
	@TableField("parent_id")
	private String parentId;
    /**
     * 分类名称
     */
	private String name;
    /**
     * 排序
     */
	private Integer sort;
    /**
     * 目录类型 2=二级目录/1=一级目录/0=总目录
     */
	private Integer type;
    /**
     * 状态 1=显示/0=隐藏
     */
	private Integer status;
    /**
     * 是否导航栏 1=显示/0=隐藏
     */
	@TableField("show_in_nav")
	private Integer showInNav;
    /**
     * 是否置顶 1=置顶/0=默认
     */
	@TableField("show_in_top")
	private Integer showInTop;
    /**
     * 是否热门 1=热门/0=默认
     */
	@TableField("show_in_hot")
	private Integer showInHot;
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
     * 页面标题
     */
	@TableField("page_title")
	private String pageTitle;
    /**
     * 页面描述
     */
	@TableField("page_description")
	private String pageDescription;
    /**
     * 页面关键词
     */
	@TableField("page_keyword")
	private String pageKeyword;
    /**
     * 备注信息
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
