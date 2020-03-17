package com.morning.shop.product.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.morning.common.base.PageInfo;
import com.morning.common.service.shop.product.ao.QueryProductListAO;
import com.morning.common.service.shop.product.dto.AdvertDTO;
import com.morning.common.service.shop.product.dto.ProductDTO;
import com.morning.common.service.shop.product.dto.HotProductDTO;
import com.morning.common.service.shop.product.entity.Product;
import com.morning.common.service.shop.product.dto.ProductDetailDTO;
import com.morning.common.base.BasePageDTO;

import java.util.List;

/**
 * 项目名称：morning-product-facade
 * 类名称：IProductService
 * 类描述：Product / 商品表 业务逻辑层接口
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:13:06
 */
public interface IProductService extends IService<Product> {

    /**
     * productDetail 商品列表
     * <p>根据传过来的商品编号获取商品列表<br>
     *
     * @param categoryId 查询参数
     * @param pageInfo 分页参数
     * @return 商品列表
     */
    Page<ProductDTO> selectProductListPage(QueryProductListAO query);

    /**
     * productDetail 详情信息
     * <p>根据传过来的商品编号获取商品详情信息<br>
     *
     * @param productId 商品Id
     * @return 商品详情
     */
    ProductDetailDTO queryProductDetail(String productId);

}
