package com.morning.shop.product.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.service.shop.product.dto.CouponDTO;
import com.morning.common.service.shop.product.dto.ProductVouchDTO;
import com.morning.common.service.shop.product.entity.Coupon;
import com.morning.common.service.shop.product.entity.ProductVouch;
import com.morning.shop.product.dao.ProductVouchMapper;
import com.morning.shop.product.service.IProductVouchService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 商品担保 服务实现类
 * </p>
 *
 * @author 赵娟娟
 * @since 2020-03-20
 */
@Service
public class ProductVouchServiceImpl extends ServiceImpl<ProductVouchMapper, ProductVouch> implements IProductVouchService {
    @Autowired
    private ProductVouchMapper productVouchMapper;

    @Override
    public List<ProductVouchDTO> queryProductVouchDTOList(String productId) {
        EntityWrapper<ProductVouch> wrapper = new EntityWrapper<ProductVouch>();
        // 店铺或商品流水号
        wrapper.eq("product_id",productId);
        List<ProductVouch> list = productVouchMapper.selectList(wrapper); // 如果为Null，默认查询所有
        List<ProductVouchDTO> dtoList=new ArrayList<>();
        for (ProductVouch coupon :list){
            ProductVouchDTO dto=new ProductVouchDTO();
            BeanUtils.copyProperties(coupon,dto);
            dtoList.add(dto);
        }
        return dtoList;
    }
}
