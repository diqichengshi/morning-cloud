package com.morning.shop.product.web;

import com.morning.common.base.MorningResult;
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
@Controller
@RequestMapping(value = "/product")
public class ProductController {

    @Autowired
    private IProductService productService;

    /**
     * productDetail 商品列表
     * <p>根据传过来的商品编号获取商品列表<br>
     *
     * @param queryAO 查询参数
     * @return 商品详情
     */
    @GetMapping(value = "/productList")
    @ResponseBody
    public MorningResult<BasePageDTO<ProductDTO>> queryProductList(String categoryId) {
        BasePageDTO<ProductDTO> basePageDTO = productService.queryProductList(categoryId, null);
        return MorningResult.ok(basePageDTO);
    }
    /**
     * productDetail 精选商品列表
     * <p>根据传过来的商品编号获取商品列表<br>
     *
     * @param queryAO 查询参数
     * @return 精选商品列表
     */
    @GetMapping(value = "/niceProductList")
    @ResponseBody
    public MorningResult<List<ProductDTO>> queryChosenProductList() {
        List<ProductDTO> productList = productService.queryNiceProductList();
        return MorningResult.ok(productList);
    }

    /**
     * productDetail 秒杀商品列表
     * <p>根据传过来的商品编号获取商品列表<br>
     *
     * @param queryAO 查询参数
     * @return 秒杀商品列表
     */
    @GetMapping(value = "/seckillProductList")
    @ResponseBody
    public MorningResult<SeckillDTO> querySeckillProductList() {
        List<ProductDTO> productList = productService.querySeckillProductList();
        SeckillDTO seckillDTO=new SeckillDTO();
        seckillDTO.setSeckillsHours("1");
        seckillDTO.setSeckillsMinutes("38");
        seckillDTO.setSeckillsSeconds("36");
        seckillDTO.setProductList(productList);
        return MorningResult.ok(seckillDTO);
    }

    /**
     * productDetail 详情信息
     * <p>根据传过来的商品编号获取商品详情信息<br>
     *
     * @param productId 商品Id
     * @return 商品详情
     */
    @GetMapping(value = "/productDetail")
    @ResponseBody
    public MorningResult<ProductDetailDTO> productDetail(@RequestParam("productId") String productId) {
        // 根据商品编号查找商品信息
        ProductDetailDTO productDetailDTO = productService.queryProductDetail(productId);
        return MorningResult.ok(productDetailDTO);
    }


}
