package com.morning.shop.product.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.morning.common.service.shop.product.dto.GroupBuyDTO;
import com.morning.common.service.shop.product.dto.SeckillProdcutDTO;
import com.morning.common.service.shop.product.entity.GroupBuy;
import com.morning.common.service.shop.product.entity.SeckillProdcut;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 项目名称：morning-product-service
 * 类名称：RecommendMapper
 * 类描述：Recommend / 推荐表 数据访问层接口
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:15:36
 */
@Mapper
public interface SeckillProductMapper extends BaseMapper<SeckillProdcut> {
    /**
     * recommendQueryAO 商品推荐列表
     * <p>根据传过来的商品Id获取商品商品评论列表<br>
     *
     * @param productId 商品productId
     * @return 商品推荐列表
     */
    List<SeckillProdcutDTO> querySeckillProductListPage(Page page);
}