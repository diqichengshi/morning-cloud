package com.morning.shop.product.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.morning.common.service.shop.product.ao.QueryRecommendListAO;
import com.morning.common.service.shop.product.dto.ProductImgDTO;
import com.morning.common.service.shop.product.dto.ReconmmendDTO;
import com.morning.common.service.shop.product.entity.ProductImg;
import com.morning.common.service.shop.product.entity.Recommend;

import java.util.List;

/**
 * 项目名称：morning-product-facade
 * 类名称：IRecommendService
 * 类描述：Recommend / 商品图片 业务逻辑层接口
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:13:36
 */
public interface IProductImgService extends IService<ProductImg> {
    /**
     * <p>根据传过来的商品编号获取商品图片信息<br>
     *
     * @param productId 商品Id
     * @return 商品图片信息
     */
    List<ProductImgDTO> queryProductImgList(String productId);
}
