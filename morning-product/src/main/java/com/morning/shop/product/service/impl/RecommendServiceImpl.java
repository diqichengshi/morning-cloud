package com.morning.shop.product.service.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.base.PageInfo;
import com.morning.common.constant.enums.ListNumEnum;
import com.morning.common.service.shop.product.ao.RecommendQueryAO;
import com.morning.common.service.shop.product.dto.ReconmmendDTO;
import com.morning.common.service.shop.product.entity.Recommend;
import com.morning.shop.product.dao.RecommendMapper;
import com.morning.shop.product.service.IRecommendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 项目名称：morning-product-service
 * 类名称：RecommendServiceImpl
 * 类描述：Recommend / 推荐位表 业务逻辑层接口实现
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:17:47
 */
@Service("recommendService")
public class RecommendServiceImpl extends ServiceImpl<RecommendMapper, Recommend> implements IRecommendService {
    @Autowired
    private RecommendMapper recommendMapper;

    @Override
    public List<List<ReconmmendDTO>> queryProductRecommendList(String productId) {
        PageInfo pageInfo = PageInfo.buildPageInfo(ListNumEnum.DEFAULT_LIST_OFFSET.getNum(),
                ListNumEnum.RECOMMEND_PRODUCT_LIMIT.getNum());
        RecommendQueryAO recommendQueryAO = new RecommendQueryAO(pageInfo);
        recommendQueryAO.setProductId(productId);
        List<ReconmmendDTO> list = recommendMapper.queryProductRecommendList(recommendQueryAO);
        List<ReconmmendDTO> list1 = new ArrayList<>();
        List<ReconmmendDTO> list2 = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            if (i<4){
                list1.add(list.get(i));
            }else {
                list2.add(list.get(i));
            }
        }
        List<List<ReconmmendDTO>> reconmmendList = new ArrayList<>();
        reconmmendList.add(list1);
        reconmmendList.add(list2);
        return reconmmendList;
    }

}
