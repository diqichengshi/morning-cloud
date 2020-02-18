package com.morning.shop.product.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.morning.common.service.shop.user.entity.Favorite;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目名称：morning-user-service
 * 类名称：FavoriteMapper
 * 类描述：Favorite / 收藏夹表 数据访问层接口
 * 创建人：赵娟娟
 * 创建时间：2017年5月9日 下午7:57:48
 */
@Mapper
public interface FavoriteMapper extends BaseMapper<Favorite> {

}