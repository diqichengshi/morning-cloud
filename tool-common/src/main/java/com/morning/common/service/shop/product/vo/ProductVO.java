package com.morning.common.service.shop.product.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@JsonInclude(Include.NON_NULL)
@Data
public class ProductVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
    /**
     * 商品ID
     */
	private String productId;
	
    /**
     * 商品名称
     */
	private String name;
	
    /**
     * 显示价格
     */
	private BigDecimal showPrice;
	
    /**
     * 显示积分
     */
	private Integer showScore;
	
    /**
     * 商品简介
     */
	private String introduce;
	
	/**
	 * 商品描述 
	 */
	private String description;
	
    /**
     * 展示图片
     */
	private String picImg;
	
	/**
	 * 评论数量
	 */
	private Integer commentNumber;
	
	/**
	 * 标签名称
	 */
	private String labelName;

}
