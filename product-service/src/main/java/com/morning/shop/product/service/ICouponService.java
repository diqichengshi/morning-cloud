package com.morning.shop.product.service;

import com.baomidou.mybatisplus.service.IService;
import com.morning.common.service.shop.product.dto.CouponDTO;
import com.morning.common.service.shop.product.entity.Coupon;

import java.util.List;

/**
 * <p>
 * 优惠券 服务类
 * </p>
 *
 * @author 赵娟娟
 * @since 2020-03-20
 */
public interface ICouponService extends IService<Coupon> {
    /**
     *  查询购物券
     *
     * @param productId 商品productId
     * @return 商品推荐列表
     */
    List<CouponDTO> queryCouponDTOList(String productId);
}
