package com.morning.shop.product.web;

import java.util.List;

import com.morning.common.service.shop.product.dto.ReconmmendDTO;
import com.morning.shop.product.service.IRecommendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.morning.common.base.MorningResult;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


/**
 * 项目名称：morning-os-web Maven Webapp
 * 类名称：ProductRecommendController
 * 类描述：商品推荐表示层控制器
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:37:59
 */
@RestController
@RequestMapping(value = "/recommend")
public class RecommendController {

    @Autowired
    private IRecommendService recommendService;

    /**
     * GET 商品推荐
     *
     * @return
     */
    @RequestMapping(value = "/recommendList")
    @ResponseBody
    public MorningResult<List<List<ReconmmendDTO>>> queryProductRecommendList(String productId) {
        List<List<ReconmmendDTO>> list = recommendService.queryProductRecommendList( productId);
        return MorningResult.ok(list);
    }

}
