package com.morning.shop.product.service;

import com.baomidou.mybatisplus.service.IService;
import com.morning.common.base.PageInfo;
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
     * @param queryAO 查询参数
     * @return 商品列表
     */
    BasePageDTO<ProductDTO> queryProductList(String categoryId, PageInfo pageInfo);
    /**
     * productDetail 精选商品列表
     * <p>根据传过来的商品编号获取商品列表<br>
     *
     * @param queryAO 查询参数
     * @return 精选商品列表
     */
    List<ProductDTO> queryNiceProductList();
    /**
     * productDetail 精选秒杀商品列表
     * <p>根据传过来的商品编号获取商品列表<br>
     *
     * @param queryAO 查询参数
     * @return 精选秒杀商品列表
     */
    List<ProductDTO> querySeckillProductList();
    /**
     * productDetail 详情信息
     * <p>根据传过来的商品编号获取商品详情信息<br>
     *
     * @param productId 商品Id
     * @return 商品详情
     */
    ProductDetailDTO queryProductDetail(String productId);


    /**
     * productDetail 点评热销商品
     * <p>根据传过来的商品编号获取商品详情信息<br>
     *
     * @param productId 店铺Id
     * @return 点评热销商品
     */
    List<HotProductDTO> queryHotProductList(String shopId);

}
