package com.morning.shop.product.service.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.service.shop.product.dto.KindDTO;
import com.morning.common.service.shop.product.entity.Kind;
import com.morning.shop.product.dao.KindMapper;
import com.morning.shop.product.service.IKindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 项目名称：morning-product-service
 * 类名称：KindServiceImpl
 * 类描述：Kind / 规格表 业务逻辑层接口实现
 * 创建人：赵娟娟
 * 创建时间：2017年4月14日 上午2:08:37
 */
@Service("kindService")
public class KindServiceImpl extends ServiceImpl<KindMapper, Kind> implements IKindService {
    @Autowired
    private KindMapper kindMapper;

    @Override
    public  List<List<KindDTO>> queryProductKindList(String productId) {
        List<List<KindDTO>> kindList=new ArrayList<>();
        List<KindDTO> list=kindMapper.queryProductKindList(productId);
        kindList.add(list);
        return kindList;
    }
}
