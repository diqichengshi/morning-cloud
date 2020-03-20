package com.morning.shop.product.service;

import com.baomidou.mybatisplus.service.IService;
import com.morning.common.service.shop.product.dto.SpecGroupDTO;
import com.morning.common.service.shop.product.dto.SpecParamDTO;
import com.morning.common.service.shop.product.entity.SpecGroup;
import com.morning.common.service.shop.product.entity.SpecParam;

import java.util.List;

/**
 * 类描述：规格分组
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:13:36
 */
public interface ISpecParamService extends IService<SpecParam> {
    /**
     *  根据规格组查询规格参数
     *
     * @param specGroupDTOList 规格组
     * @return 规格参数
     */
    List<SpecParamDTO> querySpecParamDTOList(List<SpecGroupDTO> specGroupDTOList);

    String querySpecParamNameStitching(String specParanId);
}
