package com.morning.shop.product.web;


import com.morning.common.base.BasePageDTO;
import com.morning.common.base.MorningResult;
import com.morning.common.service.shop.product.dto.AdvertDTO;
import com.morning.common.service.shop.product.dto.AdvertItem;
import com.morning.common.service.shop.product.dto.CarouselDTO;
import com.morning.shop.product.service.IAdvertService;
import com.morning.shop.product.service.impl.AdvertServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 首页专栏 前端控制器
 * </p>
 *
 * @author 赵娟
 * @since 2019-10-08
 */
@RestController
@RequestMapping("/advert")
public class AdvertController {
    @Autowired
    private IAdvertService advertService;

    /**
     * queryHomeAdvertList 查询首页轮播列表
     *
     * @param queryAO 查询参数
     * @return 首页轮播列表
     */
    @GetMapping(value = "/carouselEatList")
    @ResponseBody
    public MorningResult<List<CarouselDTO>> queryCarouselList() {
        List<CarouselDTO> list = advertService.queryCarouselList();
        return MorningResult.ok(list);
    }
}

