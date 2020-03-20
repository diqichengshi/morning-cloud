package com.morning.shop.product.web;

import java.util.List;

import com.baomidou.mybatisplus.plugins.Page;
import com.morning.common.service.shop.product.ao.QueryRecommendListAO;
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
    public MorningResult<Page<ReconmmendDTO>> queryProductRecommendList(QueryRecommendListAO query) {
        Page<ReconmmendDTO> page = recommendService.queryRecommendListPage( query);
        return MorningResult.ok(page);
    }

}
