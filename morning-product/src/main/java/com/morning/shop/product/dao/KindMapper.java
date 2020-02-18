package com.morning.shop.product.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.morning.common.service.shop.product.dto.KindDTO;
import com.morning.common.service.shop.product.entity.Kind;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 项目名称：morning-product-service
 * 类名称：KindMapper
 * 类描述：Kind / 规格表 数据访问层接口
 * 创建人：赵娟娟
 * 创建时间：2017年4月14日 上午2:05:52
 */
@Mapper
public interface KindMapper extends BaseMapper<Kind> {
    /**
     * productDetail 商品规格列表
     * <p>根据传过来的商品Id获取商品规格列表<br>
     *
     * @param productId 商品productId
     * @return 商品规格列表
     */
    List<KindDTO> queryProductKindList(@Param("productId") String productId);
}