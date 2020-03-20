package com.morning.shop.product.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.morning.common.service.shop.product.ao.QueryGroupBuyListAO;
import com.morning.common.service.shop.product.ao.QuerySeckillProductListAO;
import com.morning.common.service.shop.product.dto.GroupBuyDTO;
import com.morning.common.service.shop.product.dto.SeckillProdcutDTO;
import com.morning.common.service.shop.product.entity.GroupBuy;
import com.morning.common.service.shop.product.entity.SeckillProdcut;

/**
 * 项目名称：morning-product-facade
 * 类名称：IRecommendService
 * 类描述：Recommend / 推荐位表 业务逻辑层接口
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:13:36
 */
public interface ISeckillProductService extends IService<SeckillProdcut> {
    /**
     * productDetail 商品推荐列表
     * <p>根据传过来的商品Id获取商品商品评论列表<br>
     *
     * @param productId 商品productId
     * @return 商品推荐列表
     */
    Page<SeckillProdcutDTO> querySeckillProductListPage(QuerySeckillProductListAO query);
}
