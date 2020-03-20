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
    private String title;
    /**
     * 展示图片
     */
    private String showImg;

    /**
     * 展示价格
     */
    private String price;
    /**
     * 折扣(默认1不打折)
     */
    private String discount;
    /**
     * 折扣价格
     */
    private String discountPrice;
    /**
     * 积分
     */
    private String score;
    /**
     * 总库存
     */
    private String stock;
    /**
     * 销量
     */
    private String salesVolume;
    /**
     * 浏览量
     */
    private String pageViewNum;

}
