package com.morning.common.service.shop.product.dto;

import com.morning.common.base.KvBean;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 赵娟 on 2019/3/28.
 * 描述:
 */
@Data
public class ProductDetailDTO implements Serializable {

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
     * 展示图片
     */
    private List<String> smallImg;
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
    private List<String> commentNumDetail;
    /**
     * 商品标签
     */
    private List<String> tags;
    /**
     * 商品折扣
     */
    private List<String> discount;
    /**
     * 商品推广
     */
    private List<String> promotion;
    /**
     * 商品介绍
     */
    private List<String> detail;
    /**
     * 商品参数
     */
    private List<KvBean> parameter;
    /**
     * 产品规格列表
     */
    List<List<KindDTO>> kindList;
    /**
     * 热销产品列表
     */
    List<HotProductDTO> hotProductList;

    ConmmentDetailDTO conmmentDetail;

}
