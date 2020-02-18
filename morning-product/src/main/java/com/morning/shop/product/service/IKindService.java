package com.morning.shop.product.service;

import com.baomidou.mybatisplus.service.IService;
import com.morning.common.service.shop.product.dto.KindDTO;
import com.morning.common.service.shop.product.entity.Kind;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 项目名称：morning-product-service
 * 类名称：IKindService
 * 类描述：Kind / 规格表 业务逻辑层接口
 * 创建人：赵娟娟
 * 创建时间：2017年4月14日 上午2:03:23
 */
public interface IKindService extends IService<Kind> {
    /**
     * productDetail 商品规格列表
     * <p>根据传过来的商品Id获取商品规格列表<br>
     *
     * @param productId 商品productId
     * @return 商品规格列表
     */
    List<List<KindDTO>> queryProductKindList(String productId);
}
