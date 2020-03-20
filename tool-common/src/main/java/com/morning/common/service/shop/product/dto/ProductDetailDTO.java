package com.morning.common.service.shop.product.dto;

import com.morning.common.base.KvBean;
import com.morning.common.service.shop.product.entity.ProductDetailDO;
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

    private ProductDetailDO product;
    /**
     * 商品图片列表
     */
    private List<ProductImgDTO> productImgList;
    /**
     * 商品规格组列表
     */
    private List<SpecGroupDTO> specGroupList;
    /**
     * 商品规格参数列表
     */
    private List<SpecParamDTO> specParamList;
    /**
     * 优惠券列表
     */
    private List<CouponDTO> couponList;
    /**
     * 商品保证列表
     */
    List<ProductVouchDTO> productVouchList;

}
