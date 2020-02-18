package com.morning.shop.product.service.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.base.BasePageDTO;
import com.morning.common.base.PageInfo;
import com.morning.common.base.exception.BusinessException;
import com.morning.common.base.exception.enums.ProductExceptionEnum;
import com.morning.common.constant.RedisKey;
import com.morning.common.constant.enums.ListNumEnum;
import com.morning.common.service.shop.product.entity.ProductDetailDO;
import com.morning.common.service.shop.product.dto.*;
import com.morning.common.service.shop.product.entity.Product;
import com.morning.common.util.JsonUtil;
import com.morning.shop.product.dao.ProductMapper;
import com.morning.shop.product.service.ICommentService;
import com.morning.shop.product.service.IKindService;
import com.morning.shop.product.service.IProductService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;

/**
 * 项目名称：morning-product-service
 * 类名称：ProductServiceImpl
 * 类描述：Product / 商品表 业务逻辑层接口实现
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:17:31
 */
@Service("productService")
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements IProductService {

    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ICommentService commentService;
    @Autowired
    private IKindService kindService;
    @Autowired
    private RedisTemplate<String, String> redisTemplate;


    @Override
    public BasePageDTO<ProductDTO> queryProductList(String categoryId, PageInfo pageInfo) {
        if (null == pageInfo) {
            pageInfo = PageInfo.buildPageInfo(ListNumEnum.DEFAULT_LIST_OFFSET.getNum(), ListNumEnum.PRODUCT_LIMIT.getNum());
        }
        List<ProductDTO> productList = productMapper.selectProductList(categoryId, pageInfo);
        pageInfo.setTotal(productList.size());
        return new BasePageDTO<ProductDTO>(pageInfo, productList);
    }

    @Override
    public List<ProductDTO> queryNiceProductList() {
        PageInfo pageInfo = PageInfo.buildPageInfo(ListNumEnum.DEFAULT_LIST_OFFSET.getNum(),
                ListNumEnum.NICE_PRODUCT_LIMIT.getNum());
        List<ProductDTO> productList = productMapper.selectProductList("", pageInfo);
        productList.forEach(product -> {
            // 生成随机图片,开发方便,不搭建图片服务器
            Random r = new Random(1);
            int num = r.nextInt(2);
            if (num ==1){
                product.setBigImg("static/img/goodsList/item-as-img-1.jpg");
            }else {
                product.setBigImg("static/img/goodsList/item-as-img-2.jpg");
            }
        });
        return productList;
    }

    @Override
    public List<ProductDTO> querySeckillProductList() {
        PageInfo pageInfo = PageInfo.buildPageInfo(ListNumEnum.DEFAULT_LIST_OFFSET.getNum(),
                ListNumEnum.SECKILL_PRODUCT_LIMIT.getNum());
        List<ProductDTO> productList = productMapper.selectProductList("", pageInfo);
        return productList;
    }

    @Override
    public ProductDetailDTO queryProductDetail(String productId) {
        ProductDetailDO detailDO= productMapper.selectProductDetail(productId);
        // 根据商品编号查找商品信息
        ProductDetailDTO product = new ProductDetailDTO();
        BeanUtils.copyProperties(detailDO,product);
        product.setTags(JsonUtil.toList(detailDO.getTags()));
        product.setDiscount(JsonUtil.toList(detailDO.getDiscount()));
        product.setPromotion(JsonUtil.toList(detailDO.getPromotion()));
        product.setDetail(JsonUtil.toList(detailDO.getDetail()));
        product.setParameter(JsonUtil.toList(detailDO.getParameter()));
        product.setCommentNumDetail(JsonUtil.toList(detailDO.getCommentNumDetail()));
        product.setSmallImg(JsonUtil.toList(detailDO.getSmallImg()));
        if (null == product){
            throw new BusinessException(ProductExceptionEnum.PRODUCT_NOT_EXIST);
        }

        // 产品规格
        List<List<KindDTO>> kindList=kindService.queryProductKindList(productId);

        product.setKindList(kindList);
        // 热销产品列表
        List<HotProductDTO> hotProductList=queryHotProductList(product.getShopId());
        product.setHotProductList(hotProductList);
        // 评论列表 只查询查询第一页的评论数据
        ConmmentDetailDTO conmmentDetail = commentService.queryProductConmmentDetail(productId);
        product.setConmmentDetail(conmmentDetail);
        // 把结果添加到缓存
        String jsonStr = JsonUtil.toJsonStr(product);
        redisTemplate.opsForValue().set(RedisKey.PRODUCT_DETAIL + ":" + productId, jsonStr);
        return product;

        /*String redisShopProductDetail=redisTemplate.opsForValue().get(
                RedisKey.REDIS_SHOP_PRODUCT_DETAIL+":"+productId+":product");
        // 先从缓存中查找
        if (StrUtil.isNotBlank(redisShopProductDetail)){
            ProductDetailDTO productDetailDTO= JsonUtil.toPojo(redisShopProductDetail,ProductDetailDTO.class);
            return productDetailDTO;
        }else {
            // 根据商品编号查找商品信息
            ProductDetailDTO product = productMapper.queryProductDetail(productId);
            // 只查询查询第一页的评论数据
            List<ConmmentDTO> conmmentList = commentService.queryProductConmmentList(productId,null);
            product.setConmmentList(conmmentList); // 评论列表
            // 把结果添加到缓存
            String jsonStr= JsonUtil.toJsonStr(product);
            redisTemplate.opsForValue().set(RedisKey.REDIS_SHOP_PRODUCT_DETAIL
                    +":"+productId+":product",jsonStr);
            return product;
        }*/
    }


    @Override
    public List<HotProductDTO> queryHotProductList(String shopId) {
       PageInfo pageInfo = PageInfo.buildPageInfo(ListNumEnum.DEFAULT_LIST_OFFSET.getNum(),
               ListNumEnum.HOT_PRODUCT_LIMIT.getNum());
        return  productMapper.selectHotProductList(shopId,pageInfo);
    }
}
