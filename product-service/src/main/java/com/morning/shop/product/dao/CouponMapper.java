package com.morning.shop.product.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.morning.common.service.shop.product.entity.Coupon;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 优惠券 Mapper 接口
 * </p>
 *
 * @author 赵娟娟
 * @since 2020-03-20
 */
@Mapper
public interface CouponMapper extends BaseMapper<Coupon> {

}
