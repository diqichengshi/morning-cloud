package com.morning.shop.product.service.impl;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.service.shop.product.ao.QueryRecommendListAO;
import com.morning.common.service.shop.product.dto.ProductImgDTO;
import com.morning.common.service.shop.product.dto.ReconmmendDTO;
import com.morning.common.service.shop.product.dto.SpecGroupDTO;
import com.morning.common.service.shop.product.entity.ProductImg;
import com.morning.common.service.shop.product.entity.Recommend;
import com.morning.common.service.shop.product.entity.SpecGroup;
import com.morning.shop.product.dao.RecommendMapper;
import com.morning.shop.product.dao.SpecGroupMapper;
import com.morning.shop.product.service.IRecommendService;
import com.morning.shop.product.service.ISpecGroupService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 类描述：
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:17:47
 */
@Service("specGroupService")
public class SpecGroupServiceImpl extends ServiceImpl<SpecGroupMapper, SpecGroup> implements ISpecGroupService {
    @Autowired
    private SpecGroupMapper specGroupMapper;

    @Override
    public List<SpecGroupDTO> querySpecGroupDTOList(String productId) {
        EntityWrapper<SpecGroup> wrapper = new EntityWrapper<SpecGroup>();
        wrapper.eq("product_id",productId);
        List<SpecGroup> list = specGroupMapper.selectList(wrapper); // 如果为Null，默认查询所有
        List<SpecGroupDTO> dtoList=new ArrayList<>();
        for (SpecGroup specGroup :list){
            SpecGroupDTO dto=new SpecGroupDTO();
            BeanUtils.copyProperties(specGroup,dto);
            dtoList.add(dto);
        }
        return dtoList;
    }
}
