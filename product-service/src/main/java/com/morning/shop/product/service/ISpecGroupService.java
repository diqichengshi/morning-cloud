package com.morning.shop.product.service;

import com.baomidou.mybatisplus.service.IService;
import com.morning.common.service.shop.product.dto.ProductImgDTO;
import com.morning.common.service.shop.product.dto.SpecGroupDTO;
import com.morning.common.service.shop.product.entity.ProductImg;
import com.morning.common.service.shop.product.entity.SpecGroup;

import java.util.List;

/**
 * 类描述：规格分组
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:13:36
 */
public interface ISpecGroupService extends IService<SpecGroup> {
    /**
     *  根据商户号查询规格组
     *
     * @param productId 商户号
     * @return 规格组
     */
    List<SpecGroupDTO> querySpecGroupDTOList(String productId);
}
