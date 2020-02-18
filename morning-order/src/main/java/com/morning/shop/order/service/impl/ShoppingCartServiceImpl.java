package com.morning.shop.order.service.impl;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import com.morning.common.base.MorningResult;
import com.morning.common.base.exception.BusinessException;
import com.morning.common.base.exception.enums.ProductExceptionEnum;
import com.morning.common.constant.enums.YesOrNotEnum;
import com.morning.common.service.shop.order.ao.CartSelectAO;
import com.morning.common.service.shop.order.ao.CartSelectAllAO;
import com.morning.common.service.shop.order.ao.ShoppingCartAO;
import com.morning.common.service.shop.order.entity.ShoppingCart;
import com.morning.common.service.shop.product.vo.CartVO;
import com.morning.common.service.shop.product.vo.ShoppingCartVO;
import com.morning.common.util.MiscUtil;
import com.morning.shop.order.dao.ShoppingCartMapper;
import com.morning.shop.order.service.IShoppingCartService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 项目名称：morning-product-service
 * 类名称：ShoppingCartServiceImpl
 * 类描述：ShoppingCart / 购物车表 业务逻辑层接口实现
 * 创建人：赵娟娟
 * 创建时间：2017年5月10日 下午3:56:07
 */
@Service
public class ShoppingCartServiceImpl extends ServiceImpl<ShoppingCartMapper, ShoppingCart> implements IShoppingCartService {
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private ShoppingCartMapper shoppingCartMapper;


    @Override
    public Integer addShoppingCart(ShoppingCartAO cartAO) {

        // 查找用户购物车,该商品是否存在
        ShoppingCart queryShoppingCart = new ShoppingCart();
        queryShoppingCart.setKindId(cartAO.getKindId());
        queryShoppingCart.setUserId(cartAO.getUserId());
        ShoppingCart shoppingCart = shoppingCartMapper.selectOne(queryShoppingCart);

        if (shoppingCart != null) {
            // 若数据库中购物车存在该商品,则增加该商品购买数量(在原基础上+1)
            shoppingCart.setBuyNumber(shoppingCart.getBuyNumber() + 1);
            shoppingCart.setUpdateTime(new Date());
            return shoppingCartMapper.updateById(shoppingCart);
        } else {
            // 若数据库中购物车不存在该商品,则添加该商品
            BeanUtils.copyProperties(cartAO,shoppingCart);
            shoppingCart.setCartId(MiscUtil.getUuid());
            return shoppingCartMapper.insert(shoppingCart);
        }
    }


    @Override
    public MorningResult updateProduct(ShoppingCartAO cartAO) {
        logger.info("updateProduct - 更新购物车信息. productId={}, count={}", cartAO.getProductId(), cartAO.getBuyNumber());
        // 查找用户购物车,该商品是否存在
        ShoppingCart queryShoppingCart = new ShoppingCart();
        queryShoppingCart.setKindId(cartAO.getKindId());
        queryShoppingCart.setUserId(cartAO.getUserId());
        ShoppingCart shoppingCart = shoppingCartMapper.selectOne(queryShoppingCart);

        if (shoppingCart == null) {
            logger.error("找不到商品信息, userId={}, productId={}", cartAO.getUserId(), cartAO.getProductId());
            throw new BusinessException(ProductExceptionEnum.CART_NOT_EXIST);
        }
        int resultInt;
        if (cartAO.getBuyNumber() == 0) {
            List<String> productList = Lists.newArrayList();
            productList.add(cartAO.getBuyNumber().toString());
            resultInt = shoppingCartMapper.deleteByUserIdKindIdList(cartAO.getUserId(), productList);
        } else {
            shoppingCart.setBuyNumber(cartAO.getBuyNumber());
            resultInt = shoppingCartMapper.updateById(shoppingCart);
        }

        return MorningResult.ok(resultInt);
    }



    @Override
    public CartVO queryShoppingCart(String userId) {
        // 根据用户ID查找购物车商品列表
        List<ShoppingCartVO> shoppingCartVOList = shoppingCartMapper.shoppingCartList(userId);

        if (!shoppingCartVOList.isEmpty()) {
            CartVO cartVO = new CartVO();
            cartVO.setShoppingCartVOList(shoppingCartVOList);
            return cartVO;
        } else {
            CartVO cartVO = new CartVO();
            cartVO.setShoppingCartVOList(new ArrayList<>());
            cartVO.setTotalNumber(0);
            cartVO.setTotalPrice(new BigDecimal(0));
            cartVO.setTotalScore(0);
            return cartVO;
        }
    }

    @Override
    public MorningResult deleteProduct(String userId, String kindId) {
        logger.info("deleteProduct - 删除购物车商品信息. kindId={}, userId={}", kindId, userId);
        List<String> kindIdList = Splitter.on(",").splitToList(kindId);
        int result = shoppingCartMapper.deleteByUserIdKindIdList(userId, kindIdList);
        return MorningResult.ok(result);
    }

    @Override
    public MorningResult selectOrUnSelect(CartSelectAO selectAO) {
        int result = shoppingCartMapper.checkedOrUncheckedProduct(selectAO.getUserId(), selectAO.getProductId(), selectAO.getCheckStatus());
        return MorningResult.ok(result);
    }

    @Override
    public MorningResult selectOrUnSelectAll(CartSelectAllAO selectAO) {
        int result = shoppingCartMapper.checkedOrUncheckedProduct(selectAO.getUserId(), "", selectAO.getCheckStatus());
        return MorningResult.ok(result);
    }
}
