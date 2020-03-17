package com.morning.common.service.shop.order.entity;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 
* 项目名称：morning-order-facade   
* 类名称：Order   
* 类描述：Order / 订单表 实体类   
* 创建人：赵娟娟
* 创建时间：2017年5月10日 上午10:29:17   
*
 */
@TableName("os_order")
@Data
public class Order implements Serializable  {

    private static final long serialVersionUID = 1L;
    /**
     * 订单ID
     */
	@TableField(value="order_id")
	private String orderId;
    /**
     * 用户ID
     */
	@TableField("user_id")
	private String userId;
    /**
     * 支付方式 0=线下支付，1=在线支付
     */
	@TableField("pay_type")
	private Integer payType;
    /**
     * 配送时间 1=不限送货时间，2=工作日送货，3=双休日、假日送货
     */
	@TableField("shipment_time")
	private Integer shipmentTime;
    /**
     * 配送方式 0=快递配送（免运费），1=快递配送（运费）
     */
	@TableField("shipment_type")
	private Integer shipmentType;
    /**
     * 快递费
     */
	@TableField("shipment_amount")
	private BigDecimal shipmentAmount;
    /**
     * 支付方式 1=不开发票，2=电子发票，3=普通发票
     */
	@TableField("invoice_type")
	private Integer invoiceType;
    /**
     * 发票抬头
     */
	@TableField("invoice_title")
	private String invoiceTitle;
    /**
     * 订单状态
     */
	@TableField("order_status")
	private Integer orderStatus;
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
    /**
     * 订单金额
     */
	@TableField("order_amount")
	private BigDecimal orderAmount;
    /**
     * 订单积分
     */
	@TableField("order_score")
	private Integer orderScore;
    /**
     * 支付金额 = 订单金额 + 快递费
     */
	@TableField("pay_amount")
	private BigDecimal payAmount;
    /**
     * 商品总数量
     */
	@TableField("buy_number")
	private Integer buyNumber;

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
