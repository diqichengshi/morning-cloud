package com.morning.shop.product.service;

import com.baomidou.mybatisplus.service.IService;
import com.morning.common.service.shop.product.dto.ProductVouchDTO;
import com.morning.common.service.shop.product.entity.ProductVouch;

import java.util.List;

/**
 * <p>
 * 商品担保 服务类
 * </p>
 *
 * @author 赵娟娟
 * @since 2020-03-20
 */
public interface IProductVouchService extends IService<ProductVouch> {

    List<ProductVouchDTO> queryProductVouchDTOList(String productId);

}
