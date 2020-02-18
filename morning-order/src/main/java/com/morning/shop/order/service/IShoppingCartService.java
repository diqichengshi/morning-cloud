package com.morning.shop.order.service;

import com.baomidou.mybatisplus.service.IService;
import com.morning.common.base.MorningResult;
import com.morning.common.service.shop.order.ao.CartSelectAO;
import com.morning.common.service.shop.order.ao.CartSelectAllAO;
import com.morning.common.service.shop.order.ao.ShoppingCartAO;
import com.morning.common.service.shop.order.entity.ShoppingCart;
import com.morning.common.service.shop.product.vo.CartVO;
import com.morning.common.service.shop.product.vo.ShoppingCartVO;

/**
 * 项目名称：morning-product-facade
 * 类名称：IShoppingCartService
 * 类描述：ShoppingCart / 购物车表 业务逻辑层接口
 * 创建人：赵娟娟
 * 创建时间：2017年5月10日 下午3:54:52
 */
public interface IShoppingCartService extends IService<ShoppingCart> {

    /**
     * 根据用户ID、购物车商品状态查找购物车列表
     *
     * @param userId 用户ID
     * @param status 购物车商品状态
     * @return
     */
    CartVO queryShoppingCart(String userId);
    /**
     * 创建购物车商品信息
     *
     * @param productSpecNumber 商品规格编号
     * @param userId            用户ID
     * @return
     */
    Integer addShoppingCart(ShoppingCartAO cartAO);

    /**
     * 更新购物车商品信息
     *
     * @param productSpecNumber 商品规格编号
     * @param userId            用户ID
     * @return
     */
    MorningResult updateProduct(ShoppingCartAO cartAO);

    /**
     * 根据用户ID删除购物车中选中的商品
     *
     * @param userId 用户ID
     * @return
     */
    MorningResult deleteProduct(String userId, String kindId);
    /**
     * 选中商品.
     *
     * @param ShoppingCartAO cartAO
     * @return MorningResult
     */
    MorningResult selectOrUnSelect(CartSelectAO selectAO);
    /**
     * 购物车全选商品.
     *
     * @return MorningResult
     */
    MorningResult selectOrUnSelectAll(CartSelectAllAO selectAO);
}
