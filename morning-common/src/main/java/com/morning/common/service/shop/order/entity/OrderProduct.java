package com.morning.common.service.shop.order.entity;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 
* 项目名称：morning-order-facade   
* 类名称：OrderProduct
* 类描述：OrderProduct / 订单明细表 实体类
* 创建人：赵娟娟
* 创建时间：2017年5月10日 上午10:29:38   
*
 */
@TableName("os_order_product")
@Data
public class OrderProduct implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 订单商品ID
     */
	@TableId(value="order_product_id", type= IdType.AUTO)
	private String orderProductId;
    /**
     * 订单ID
     */
	@TableField("order_id")
	private String orderId;
	/**
	 * 订单ID
	 */
	@TableField("product_id")
	private String productId;
    /**
     * 商品名称
     */
	private String name;
    /**
     * 展示图片
     */
	@TableField("pic_img")
	private String picImg;
    /**
     * 商品规格属性编号
     */
	@TableField("product_spec_attr_id")
	private String productSpecAttrId;
    /**
     * 商品规格属性名称
     */
	@TableField("product_spec_attr_name")
	private String productSpecAttrName;
    /**
     * 价格
     */
	private BigDecimal price;
    /**
     * 积分
     */
	private Integer score;
    /**
     * 商品总数量
     */
	@TableField("buy_number")
	private Integer buyNumber;
    /**
     * 商品总积分
     */
	@TableField("product_score")
	private Integer productScore;
    /**
     * 商品总金额
     */
	@TableField("product_amount")
	private BigDecimal productAmount;
    /**
     * 评论状态 0=未评论，1=已评论
     */
	@TableField("comment_status")
	private Integer commentStatus;

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
