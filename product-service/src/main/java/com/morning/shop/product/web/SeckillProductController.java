package com.morning.shop.product.web;

import com.baomidou.mybatisplus.plugins.Page;
import com.morning.common.base.MorningResult;
import com.morning.common.service.shop.product.ao.QueryGroupBuyListAO;
import com.morning.common.service.shop.product.ao.QuerySeckillProductListAO;
import com.morning.common.service.shop.product.dto.GroupBuyDTO;
import com.morning.common.service.shop.product.dto.SeckillProdcutDTO;
import com.morning.shop.product.service.IGroupBuyService;
import com.morning.shop.product.service.ISeckillProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


/**
 * 项目名称：morning-os-web Maven Webapp
 * 类名称：ProductRecommendController
 * 类描述：秒杀商品表示层控制器
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:37:59
 */
@RestController
@RequestMapping(value = "/seckill")
public class SeckillProductController {

    @Autowired
    private ISeckillProductService seckillProductService;

    /**
     * GET 秒杀商品
     *
     * @return
     */
    @RequestMapping(value = "/productList")
    @ResponseBody
    public MorningResult<Page<SeckillProdcutDTO>> querySeckillProductListPage(QuerySeckillProductListAO query) {
        Page<SeckillProdcutDTO> page = seckillProductService.querySeckillProductListPage(query);
        return MorningResult.ok(page);
    }

}
