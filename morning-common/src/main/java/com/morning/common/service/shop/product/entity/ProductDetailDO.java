package com.morning.common.service.shop.product.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * Created by lst on 2019/9/27.
 * 描述:
 */
@Data
public class ProductDetailDO implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 商品ID
     */
    private String productId;
    /**
     * 店铺Id
     */
    private String shopId;

    /**
     * 商品名称
     */
    private String name;
    /**
     * 展示图片
     */
    private String bigImg;

    /**
     * 小图
     */
    private String smallImg;
    /**
     * 展示价格
     */
    private String showPrice;
    /**
     * 评论数量
     */
    private String commentNumber;
    /**
     * 评论数量详情
     */
    private String commentNumDetail;
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
     * 商品介绍
     */
    private String detail;
    /**
     * 商品参数
     */
    private String parameter;
}
