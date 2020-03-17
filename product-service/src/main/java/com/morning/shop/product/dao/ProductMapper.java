package com.morning.shop.product.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.morning.common.base.PageInfo;
import com.morning.common.service.shop.product.entity.ProductDetailDO;
import com.morning.common.service.shop.product.dto.HotProductDTO;
import com.morning.common.service.shop.product.dto.ProductDTO;
import com.morning.common.service.shop.product.entity.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 项目名称：morning-product-service
 * 类名称：ProductMapper
 * 类描述：Product / 商品表 数据访问层接口
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:15:04
 */
@Mapper
public interface ProductMapper extends BaseMapper<Product> {
    /**
     * productDetail 商品列表
     * <p>根据传过来的商品编号获取商品列表<br>
     *
     * @param page 查询参数
     * @return 商品列表
     */
    List<ProductDTO> selectProductListPage( Page page);

    /**
     * productDetail 详情信息.
     * <p>根据传过来的商品编号获取商品详情信息<br>
     *
     * @param productId 商品Id
     * @return 商品详情
     */
    ProductDetailDO selectProductDetail(@Param("productId") String productId);


    /**
     * productDetail 热销商品列表
     * <p>根据传过来的商品编号获取热销商品列表<br>
     *
     * @param queryAO 查询参数
     * @return 热销商品列表
     */
    List<HotProductDTO> selectHotProductList(@Param("shopId") String shopId, @Param("pageInfo") PageInfo pageInfo);

}