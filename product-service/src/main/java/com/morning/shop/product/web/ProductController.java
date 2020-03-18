package com.morning.shop.product.web;

import com.baomidou.mybatisplus.plugins.Page;
import com.morning.common.base.MorningResult;
import com.morning.common.log.SysLog;
import com.morning.common.service.shop.product.ao.QueryProductListAO;
import com.morning.common.service.shop.product.dto.ProductDTO;
import com.morning.common.service.shop.product.dto.ProductDetailDTO;
import com.morning.common.base.BasePageDTO;
import com.morning.common.service.shop.product.dto.SeckillDTO;
import com.morning.shop.product.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 项目名称：morning-os-web Maven Webapp
 * 类名称：ProductDetailControlller
 * 类描述：商品详情表示层控制器
 * 创建人：赵娟娟
 * 创建时间：2017年4月24日 下午11:24:37
 */
@RestController
@RequestMapping(value = "/product")
public class ProductController {

    @Autowired
    private IProductService productService;

    /**
     * productDetail 商品列表
     * <p>根据传过来的商品编号获取商品列表<br>
     *
     * @param categoryId 查询参数
     * @return 商品详情
     */
    @RequestMapping(value = "/productList")
    @SysLog(value = "商品列表")
    public MorningResult<Page<ProductDTO>> queryProductList(QueryProductListAO query) {
        Page<ProductDTO> productList = productService.selectProductListPage(query);
        return MorningResult.ok(productList);
    }

    /**
     * productDetail 详情信息
     * <p>根据传过来的商品编号获取商品详情信息<br>
     *
     * @param productId 商品Id
     * @return 商品详情
     */
    @GetMapping(value = "/productDetail")
    public MorningResult<ProductDetailDTO> productDetail(@RequestParam("productId") String productId) {
        // 根据商品编号查找商品信息
        ProductDetailDTO productDetailDTO = productService.queryProductDetail(productId);
        return MorningResult.ok(productDetailDTO);
    }


}
