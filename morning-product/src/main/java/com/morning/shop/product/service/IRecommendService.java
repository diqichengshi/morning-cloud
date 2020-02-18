package com.morning.shop.product.service;

import com.baomidou.mybatisplus.service.IService;
import com.morning.common.service.shop.product.dto.ReconmmendDTO;
import com.morning.common.service.shop.product.entity.Recommend;

import java.util.List;

/**
 * 项目名称：morning-product-facade
 * 类名称：IRecommendService
 * 类描述：Recommend / 推荐位表 业务逻辑层接口
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:13:36
 */
public interface IRecommendService extends IService<Recommend> {
    /**
     * productDetail 商品推荐列表
     * <p>根据传过来的商品Id获取商品商品评论列表<br>
     *
     * @param productId 商品productId
     * @return 商品推荐列表
     */
    List<List<ReconmmendDTO>> queryProductRecommendList(String productId);
}
