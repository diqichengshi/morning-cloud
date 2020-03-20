package com.morning.shop.product.service.impl;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.service.shop.product.dto.SpecGroupDTO;
import com.morning.common.service.shop.product.dto.SpecParamDTO;
import com.morning.common.service.shop.product.entity.SpecGroup;
import com.morning.common.service.shop.product.entity.SpecParam;
import com.morning.common.util.StringUtil;
import com.morning.shop.product.dao.SpecGroupMapper;
import com.morning.shop.product.dao.SpecParamMapper;
import com.morning.shop.product.service.ISpecGroupService;
import com.morning.shop.product.service.ISpecParamService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 类描述：
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:17:47
 */
@Service("specParamService")
public class SpecParamServiceImpl extends ServiceImpl<SpecParamMapper, SpecParam> implements ISpecParamService {
    @Autowired
    private SpecParamMapper specParamMapper;

    @Override
    public List<SpecParamDTO> querySpecParamDTOList(List<SpecGroupDTO> specGroupDTOList) {
        if (null== specGroupDTOList ||specGroupDTOList.size()==0){
            return new ArrayList<>();
        }
        List<String> groupIdList=new ArrayList<>();
        // 拼接groupId
        StringBuilder builder=new StringBuilder();
        for (SpecGroupDTO specGroupDTO:specGroupDTOList){
            //builder.append("'").append(specGroupDTO.getId()).append("',");
            groupIdList.add(specGroupDTO.getId());
        }
        // 查询数据库
        EntityWrapper<SpecParam> wrapper = new EntityWrapper<SpecParam>();
        wrapper.in("group_id", groupIdList);
        List<SpecParam> list = specParamMapper.selectList(wrapper); // 如果为Null，默认查询所有
        List<SpecParamDTO> dtoList=new ArrayList<>();
        for (SpecParam specParam :list){
            SpecParamDTO dto=new SpecParamDTO();
            BeanUtils.copyProperties(specParam,dto);
            dto.setPid(specParam.getGroupId());
            dtoList.add(dto);
        }
        return dtoList;
    }

    @Override
    public  String querySpecParamNameStitching(String specParanId) {
        String[] array=specParanId.split(",");
        // 查询数据库
        EntityWrapper<SpecParam> wrapper = new EntityWrapper<SpecParam>();
        wrapper.in("id", Arrays.asList(array));
        List<SpecParam> list = specParamMapper.selectList(wrapper); // 如果为Null，默认查询所有

        StringBuilder builder=new StringBuilder();
        for (SpecParam specParam :list){
            builder.append(specParam.getName()).append(" ");
        }
        return builder.toString();
    }
}
