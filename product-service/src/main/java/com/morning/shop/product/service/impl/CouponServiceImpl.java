package com.morning.shop.product.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.service.shop.product.dto.CouponDTO;
import com.morning.common.service.shop.product.entity.Coupon;
import com.morning.shop.product.dao.CouponMapper;
import com.morning.shop.product.service.ICouponService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 优惠券 服务实现类
 * </p>
 *
 * @author 赵娟娟
 * @since 2020-03-20
 */
@Service("couponService")
public class CouponServiceImpl extends ServiceImpl<CouponMapper, Coupon> implements ICouponService {
    @Autowired
    private CouponMapper couponMapper;
    @Override
    public List<CouponDTO> queryCouponDTOList(String productId) {
        EntityWrapper<Coupon> wrapper = new EntityWrapper<Coupon>();
        // 店铺或商品流水号
        wrapper.eq("with_sn",productId);
        List<Coupon> list = couponMapper.selectList(wrapper); // 如果为Null，默认查询所有
        List<CouponDTO> dtoList=new ArrayList<>();
        for (Coupon coupon :list){
            CouponDTO dto=new CouponDTO();
            BeanUtils.copyProperties(coupon,dto);
            dtoList.add(dto);
        }
        return dtoList;
    }
}
