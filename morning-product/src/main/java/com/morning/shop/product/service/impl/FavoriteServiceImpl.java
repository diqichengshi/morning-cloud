package com.morning.shop.product.service.impl;



import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.base.BasePageDTO;
import com.morning.common.base.PageInfo;
import com.morning.common.constant.enums.YesOrNotEnum;
import com.morning.common.service.shop.product.entity.Product;
import com.morning.common.service.shop.user.entity.Favorite;
import com.morning.shop.product.dao.FavoriteMapper;
import com.morning.shop.product.dao.ProductMapper;
import com.morning.shop.product.service.IFavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 项目名称：morning-user-service
 * 类名称：FavoriteServiceImpl
 * 类描述：Favorite / 收藏夹 业务逻辑层接口实现
 * 创建人：赵娟娟
 * 创建时间：2017年5月9日 下午7:58:20
 */
@Service("favoriteService")
public class FavoriteServiceImpl extends ServiceImpl<FavoriteMapper, Favorite> implements IFavoriteService {

    @Autowired
    private FavoriteMapper favoriteMappper;
    @Autowired
    private ProductMapper productMapper;

    @Override
    public BasePageDTO<Favorite> listByUserId(String userId, PageInfo pageInfo) {

        Page<Favorite> page = new Page<>(pageInfo.getCurrent(), pageInfo.getLimit());

        Favorite favorite = new Favorite();
        favorite.setUserId(userId);
        EntityWrapper queryWrapper = new EntityWrapper<>(favorite);
        //queryWrapper.orderByDesc("createTime");
        List<Favorite> favorites = favoriteMappper.selectPage(page, queryWrapper);
        pageInfo.setTotal(page.getTotal());

        //return new BasePageDTO<Favorite>(favorites);
        return null;
    }

    @Override
    public boolean isUserFavorite(String userId, String productId) {
        if (userId == null) {
            return false;
        } else {
            Favorite queryFavorite = new Favorite();
            queryFavorite.setUserId(userId);
            queryFavorite.setProductId(productId);
            Favorite favorite = favoriteMappper.selectOne(queryFavorite);
            if (null == favorite) {
                return false;
            } else {
                return true;
            }
        }
    }

    @Override
    public Integer deleteByProductId(String userId, String productId) {
        Favorite favorite = new Favorite();
        favorite.setUserId(userId);
        favorite.setProductId(productId);
        return favoriteMappper.delete(new EntityWrapper<>(favorite));
    }

    @Override
    public void addByProductId(String userId, String userName, String productId) {
        Product queryProduct = new Product();
        queryProduct.setProductId(productId);
        Product product = productMapper.selectOne(queryProduct);

        Favorite favorite = new Favorite();
        favorite.setUserId(userId);
        favorite.setProductId(productId);
        favorite.setName(product.getName());
        favorite.setPicImg(product.getBigImg());
        favorite.setShowPrice(product.getShowPrice());
        favorite.setStatus(YesOrNotEnum.Y.getCode());
        favorite.setCreateBy(userName);
        favorite.setCreateTime(new Date());
        favoriteMappper.insert(favorite);
    }
}
