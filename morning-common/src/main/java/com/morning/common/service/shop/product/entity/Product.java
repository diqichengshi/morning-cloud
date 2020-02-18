package com.morning.common.service.shop.product.entity;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：Product   
* 类描述：Product / 商品表 实体类   
* 创建人：赵娟娟
* 创建时间：2017年4月11日 下午3:11:04   
*
 */
@TableName("os_product")
@Data
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;
	/**
	 * 商品ID
	 */
	@TableId(value="id")
	private String id;
    /**
     * 商品ID
     */
	@TableField(value="product_id")
	private String productId;
	/**
	 * 商户Id
	 */
	@TableField(value="merchant_id")
	private String merchantId;
	/**
	 * 商品分类ID
	 */
	@TableField(value="category_id")
	private String categoryId;
    /**
     * 标签ID
     */
	@TableField("label_id")
	private String labelId;
    /**
     * 商品名称
     */
	private String name;
    /**
     * 显示价积分
     */
	@TableField("show_score")
	private Integer showScore;
    /**
     * 显示价格
     */
	@TableField("show_price")
	private BigDecimal showPrice;
    /**
     * 产品简介
     */
	private String introduce;
	/**
	 * 展示大图片列表
	 */
	@TableField("big_img")
	private String bigImg;
    /**
     * 展示小图片列表
     */
	@TableField("small_img")
	private String smallImg;
	/**
	 * 商品介绍
	 */
	private String detail;
	/**
	 * 商品参数
	 */
	private String parameter;
    /**
     * 显示状态
     */
	@TableField("show_status")
	private Integer showStatus;
	/**
	 * 商品标签
	 */
	private String tags;
	/**
	 * 商品折扣
	 */
	private String discount;
	/**
	 * 商品推广
	 */
	private String promotion;

	/**
	 * 总库存
	 */
	private Integer stock;
	/**
	 * 销售量
	 */
	@TableField("sales_volume")
	private Integer salesVolume;
	/**
	 * 游览量
	 */
	@TableField("page_views")
	private Integer pageViews;
	/**
	 * 评论数量
	 */
	@TableField("comment_number")
	private Integer commentNumber;
	/**
	 * 评论数详情[追评,好评,中评,差评]
	 */
	@TableField("comment_num_detail")
	private Integer commentNumDetail;
	/**
	 * 收藏数
	 */
	@TableField("favorite_number")
	private Integer favoriteNumber;
	/**
	 * 提问数
	 */
	@TableField("question_number")
	private Integer questionNumber;

	/**
	 * 备注
	 */
	private String remarks;

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
     * 上架时间
     */
	@TableField("shelve_time")
	private Date shelveTime;
    /**
     * 上架人
     */
	@TableField("shelve_by")
	private String shelveBy;
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
