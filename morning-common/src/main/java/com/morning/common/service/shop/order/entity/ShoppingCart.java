package com.morning.common.service.shop.order.entity;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import lombok.Data;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：ShoppingCart   
* 类描述：ShoppingCart / 购物车表 实体类   
* 创建人：赵娟娟
* 创建时间：2017年5月10日 下午3:54:27   
*
 */
@TableName("os_shopping_cart")
@Data
public class ShoppingCart implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 购物车ID
     */
	@TableId(value="cart_id")
	private String cartId;

	/**
	 * 商品编号
	 */
	@TableField("product_id")
	private String productId;
	/**
	 * 商品规格编号
	 */
	@TableField("kind_id")
	private String kindId;
    /**
     * 用户ID
     */
	@TableField("user_id")
	private String userId;
	/**
	 * 购物车状态：0,未选中；1,选中
	 */
	@TableField("check_status")
	private Integer checkStatus;
    /**
     * 购买数量
     */
	@TableField("buy_number")
	private Integer buyNumber;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 更新时间
     */
	@TableField("update_time")
	private Date updateTime;

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
