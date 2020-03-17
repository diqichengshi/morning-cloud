package com.morning.shop.order.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import com.morning.common.service.shop.order.entity.ShoppingCart;
import com.morning.common.service.shop.product.vo.ShoppingCartVO;

import java.util.List;

/**
 * 项目名称：morning-product-service
 * 类名称：ShoppingCartMapper
 * 类描述：ShoppingCart / 购物车表 数据访问层接口
 * 创建人：赵娟娟
 * 创建时间：2017年5月10日 下午3:55:42
 */
public interface ShoppingCartMapper extends BaseMapper<ShoppingCart> {

    /**
     * 根据用户ID、产品规格编号查找购物车商品信息
     *
     * @param userId            用户ID
     * @param productSpecNumber 产品规格编号
     * @return
     */
    ShoppingCartVO queryShoppingCart(@Param("userId") String userId, @Param("kindId") String kindId);

    /**
     * 根据用户ID查找购物车商品列表
     *
     * @param userId      用户ID
     * @param checkStatus 选中状态
     * @return
     */
    List<ShoppingCartVO> shoppingCartList(@Param("userId") String userId);

    int deleteByUserIdKindIdList(@Param("userId") String userId, @Param("productList") List<String> productList);

    ShoppingCart selectByProductIdAndUserId(@Param("userId") String userId, @Param("productId") String productId);

    int checkedOrUncheckedProduct(@Param("userId") String userId,
                                  @Param("productId") String productId, @Param("checked") String checked);
}