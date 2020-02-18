package com.morning.shop.product.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.morning.common.base.MorningResult;
import com.morning.shop.product.service.IFavoriteService;


/**
 * 项目名称：morning-os-web Maven Webapp
 * 类名称：ProductDetailControlller
 * 类描述：商品详情表示层控制器
 * 创建人：赵娟娟
 * 创建时间：2017年4月24日 下午11:24:37
 */
@Controller
@RequestMapping(value = "/shop/product")
public class FavoriteController {

    @Autowired
    private IFavoriteService favoriteService;

    /**
     * GET 判断是否收藏商品页面
     *
     * @return
     */
    @GetMapping(value = "/isFavorite")
    @ResponseBody
    public Object isFavorite(@RequestParam("userId") String userId, @RequestParam("productId") String productId) {
        boolean isFavorite = favoriteService.isUserFavorite(userId, productId);
        return MorningResult.ok(isFavorite);
    }

    /**
     * GET 收藏商品页面
     *
     * @return
     */
    @GetMapping(value = "/addFavorite")
    @ResponseBody
    public Object addFavorite(@RequestParam("userId") String userId, @RequestParam("userName") String userName, @RequestParam("productId") String productId) {
        favoriteService.addByProductId(userId, userName, productId);
        return MorningResult.ok();
    }

    /**
     * GET 取消收藏商品页面
     *
     * @return
     */
    @GetMapping(value = "/deleteFavorite")
    @ResponseBody
    public Object deleteFavorite(@RequestParam("userId") String userId, @RequestParam("productId") String productId) {
        favoriteService.deleteByProductId(userId, productId);
        return MorningResult.ok();
    }
}
