package com.morning.common.service.shop.order.vo;

import com.morning.common.service.shop.order.entity.OrderProduct;
import com.morning.common.service.shop.order.entity.OrderShipment;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
@Data
public class OrderVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
    /**
     * 订单ID
     */
	private String orderId;
	
    /**
     * 用户ID
     */
	private String userId;
	
    /**
     * 支付方式 0=线下支付，1=在线支付
     */
	private Integer payType;
	
    /**
     * 配送时间 1=不限送货时间，2=工作日送货，3=双休日、假日送货
     */
	private Integer shipmentTime;
	
    /**
     * 配送方式 0=快递配送（免运费），1=快递配送（运费）
     */
	private Integer shipmentType;
	
    /**
     * 快递费
     */
	private BigDecimal shipmentAmount;
	
    /**
     * 支付方式 1=不开发票，2=电子发票，3=普通发票
     */
	private Integer invoiceType;
	
    /**
     * 发票抬头
     */
	private String invoiceTitle;
	
    /**
     * 订单状态
     */
	private Integer orderStatus;
	
    /**
     * 创建时间
     */
	private Date createTime;
	
    /**
     * 更新时间
     */
	private Date updateTime;
	
    /**
     * 订单金额
     */
	private BigDecimal orderAmount;
	
    /**
     * 订单积分
     */
	private Integer orderScore;
	
    /**
     * 支付金额 = 订单金额 + 快递费
     */
	private BigDecimal payAmount;
	
    /**
     * 商品总数量
     */
	private Integer buyNumber;
	
	/**
	 * 订单配送表
	 */
	private OrderShipment orderShipment;
	
	/**
	 * 订单明细表
	 */
	private List<OrderProduct> orderProductList;

}
