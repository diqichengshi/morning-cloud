package com.morning.shop.order.web;

import com.morning.common.base.MorningResult;
import com.morning.common.base.exception.enums.SystemErrorEnum;
import com.morning.common.constant.enums.YesOrNotEnum;
import com.morning.common.service.shop.order.ao.CartSelectAO;
import com.morning.common.service.shop.order.ao.CartSelectAllAO;
import com.morning.common.service.shop.order.ao.ShoppingCartAO;
import com.morning.common.service.shop.order.entity.ShoppingCart;
import com.morning.common.service.shop.product.vo.CartVO;
import com.morning.shop.order.service.IShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * 项目名称：morning-os-web Maven Webapp
 * 类名称：ProductCartController
 * 类描述：商品购物车表示层控制器
 * 创建人：赵娟娟
 * 创建时间：2017年5月10日 下午3:47:16
 */
@Controller
@RequestMapping(value = "/cart")
public class ShoppingCartController {

    @Autowired
    private IShoppingCartService shoppingCartService;

    /**
     * GET 购物车列表
     *
     * @return
     */
    @GetMapping(value = "/shoppingCartList")
    @ResponseBody
    public MorningResult shoppingCartList(@RequestParam("userId") String userId) {
        CartVO cartVO = shoppingCartService.queryShoppingCart(userId);
        return MorningResult.ok(cartVO);
    }

    /**
     * 购物车更新商品.
     *
     * @param ShoppingCartAO cartAO
     * @return MorningResult
     */
    @PostMapping("/addProduct")
    public MorningResult addProduct(@RequestBody ShoppingCartAO cartAO) {
        Integer count = shoppingCartService.addShoppingCart(cartAO);
        return MorningResult.ok(count);
    }

    /**
     * 购物车更新商品.
     *
     * @param ShoppingCartAO cartAO
     * @return MorningResult
     */
    @PostMapping("/updateProduct")
    public MorningResult updateProduct(@RequestBody ShoppingCartAO cartAO) {
        return shoppingCartService.updateProduct(cartAO);
    }

    /**
     * 购物车删除商品.
     *
     * @param productId 
     * @return MorningResult
     */
    @PostMapping("/deleteProduct")
    public MorningResult deleteProduct(@RequestParam("userId") String userId, @RequestParam String kindId) {
        return shoppingCartService.deleteProduct(userId, kindId);
    }

    /**
     * 购物车全选商品.
     *
     * @return MorningResult
     */
    @PostMapping("/selectAllProduct")
    public MorningResult selectAll(@RequestBody CartSelectAllAO selectAO) {
        return shoppingCartService.selectOrUnSelectAll(selectAO);
    }

    /**
     * 选中商品.
     *
     * @param ShoppingCartAO cartAO
     * @return MorningResult
     */
    @PostMapping("/selectProduct")
    public MorningResult select(@RequestBody CartSelectAO selectAO) {
        return shoppingCartService.selectOrUnSelect(selectAO);
    }

}
