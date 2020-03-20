package com.morning.shop.product.service;

import com.morning.common.base.BasePageDTO;
import com.morning.common.service.shop.product.dto.AdvertDTO;
import com.morning.common.service.shop.product.dto.AdvertItem;
import com.morning.common.service.shop.product.dto.CarouselDTO;
import com.morning.common.service.shop.product.entity.Advert;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * <p>
 * 首页专栏 服务类
 * </p>
 *
 * @author 赵娟
 * @since 2019-10-08
 */
public interface IAdvertService extends IService<Advert> {

    /**
     * queryHomeAdvertList 查询首页爱吃专栏商品列表
     *
     * @param queryAO 查询参数
     * @return 首页爱吃专栏商品列表
     */
    List<CarouselDTO> queryCarouselList();
}
