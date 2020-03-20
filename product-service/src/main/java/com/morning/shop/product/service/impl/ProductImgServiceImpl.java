package com.morning.shop.product.service.impl;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.constant.ShopConstant;
import com.morning.common.redis.RedisCache;
import com.morning.common.service.shop.product.ao.QueryRecommendListAO;
import com.morning.common.service.shop.product.dto.ProductImgDTO;
import com.morning.common.service.shop.product.dto.ReconmmendDTO;
import com.morning.common.service.shop.product.entity.ProductImg;
import com.morning.common.service.shop.product.entity.Recommend;
import com.morning.shop.product.dao.ProductImgMapper;
import com.morning.shop.product.dao.RecommendMapper;
import com.morning.shop.product.service.IProductImgService;
import com.morning.shop.product.service.IRecommendService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 类描述： 商品图片 业务逻辑层接口实现
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:17:47
 */
@Service("productImgService")
public class ProductImgServiceImpl extends ServiceImpl<ProductImgMapper, ProductImg> implements IProductImgService {
    @Autowired
    private ProductImgMapper productImgMapper;

    @Override
    @RedisCache(key = "T(com.morning.common.redis.RedisConstant).PRODUCT_IMG_LIST_KEY + #productId", expireSeconds = 30)
    public List<ProductImgDTO> queryProductImgList(String productId) {
        EntityWrapper<ProductImg> wrapper = new EntityWrapper<ProductImg>();
        wrapper.eq("product_id",productId);
        List<ProductImg> list = productImgMapper.selectList(wrapper); // 如果为Null，默认查询所有
        List<ProductImgDTO> dtoList=new ArrayList<>();
        for (ProductImg productImg :list){
            ProductImgDTO dto=new ProductImgDTO();
            BeanUtils.copyProperties(productImg,dto);
            dtoList.add(dto);
        }
        return dtoList;
    }
}
