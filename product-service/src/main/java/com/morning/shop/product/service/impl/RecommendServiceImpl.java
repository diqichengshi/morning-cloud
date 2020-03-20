package com.morning.shop.product.service.impl;


import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.base.PageInfo;
import com.morning.common.constant.enums.ListNumEnum;
import com.morning.common.service.shop.product.ao.QueryRecommendListAO;
import com.morning.common.service.shop.product.ao.RecommendQueryAO;
import com.morning.common.service.shop.product.dto.ProductDTO;
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
    public Page<ReconmmendDTO> queryRecommendListPage(QueryRecommendListAO query) {
        Page page = new Page(query.getReqPage(),query.getReqSize());
        List<ReconmmendDTO> list=recommendMapper.queryRecommendListPage(page);
        page.setRecords(list);
        return page;
    }

}
