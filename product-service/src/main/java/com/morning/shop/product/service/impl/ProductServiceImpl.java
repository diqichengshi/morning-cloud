package com.morning.shop.product.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.base.exception.BusinessException;
import com.morning.common.base.exception.enums.ProductExceptionEnum;
import com.morning.common.service.shop.product.ao.QueryProductListAO;
import com.morning.common.service.shop.product.entity.ProductDetailDO;
import com.morning.common.service.shop.product.dto.*;
import com.morning.common.service.shop.product.entity.Product;
import com.morning.shop.product.dao.ProductMapper;
import com.morning.shop.product.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 项目名称：morning-product-service
 * 类名称：ProductServiceImpl
 * 类描述：Product / 商品表 业务逻辑层接口实现
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:17:31
 */
@Component("productService")
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements IProductService {

    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ICommentDetailService commentService;
    @Autowired
    private IKindService kindService;
    @Autowired
    private RedisTemplate<String, String> redisTemplate;
    @Autowired
    private IProductImgService productImgService;
    @Autowired
    private ISpecGroupService specGroupService;
    @Autowired
    private ISpecParamService specParamService;
    @Autowired
    private ICouponService couponService;
    @Autowired
    private IProductVouchService productVouchService;

    @Override
    public Page<ProductDTO> selectProductListPage(QueryProductListAO query) {
        Page page = new Page(query.getReqPage(),query.getReqSize());
        List<ProductDTO> list=productMapper.selectProductListPage(page);
        page.setRecords(list);
        return page;
    }

    @Override
    public ProductDetailDTO queryProductDetail(String productId) {
        ProductDetailDO productDetailDO= queryProductDetailDOByProductId(productId);
        if (null == productDetailDO){
            throw new BusinessException(ProductExceptionEnum.PRODUCT_NOT_EXIST);
        }

        // 根据商品编号查找商品信息
        ProductDetailDTO detailDTO = new ProductDetailDTO();
        detailDTO.setProduct(productDetailDO);

        // 查询商品图片
        List<ProductImgDTO> productImgDTOList=productImgService.queryProductImgList(productId);
        detailDTO.setProductImgList(productImgDTOList);

        // 商品规格组
        List<SpecGroupDTO> specGroupDTOList=specGroupService.querySpecGroupDTOList(productId);
        detailDTO.setSpecGroupList(specGroupDTOList);

        // 商品规格参数
        List<SpecParamDTO> specParamDTOList=specParamService.querySpecParamDTOList(specGroupDTOList);
        detailDTO.setSpecParamList(specParamDTOList);

        // 优惠券
        List<CouponDTO> couponDTOList=couponService.queryCouponDTOList(productId);
        detailDTO.setCouponList(couponDTOList);

        // 商品保证
        List<ProductVouchDTO> productVouchDTOList=  productVouchService.queryProductVouchDTOList(productId);
        detailDTO.setProductVouchList(productVouchDTOList);

        return detailDTO;

    }

    public ProductDetailDO queryProductDetailDOByProductId(String productId){
        ProductDetailDO productDetailDO= productMapper.selectProductDetail(productId);
        if (!"1".equals(productDetailDO.getDiscount())){
            int tempDiscount= Integer.valueOf(productDetailDO.getDiscount());
            productDetailDO.setDiscount(String.valueOf(tempDiscount*10)+"折");
            int tempPrice=Integer.valueOf(productDetailDO.getPrice());
            productDetailDO.setDiscountPrice(String.valueOf(tempPrice*tempDiscount));
        }else {
            productDetailDO.setDiscount("");
            productDetailDO.setDiscountPrice("");
        }
        return productDetailDO;
    }

}
