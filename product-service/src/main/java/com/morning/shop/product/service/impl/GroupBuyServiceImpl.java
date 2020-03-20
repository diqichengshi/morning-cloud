package com.morning.shop.product.service.impl;


import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.service.shop.product.ao.QueryGroupBuyListAO;
import com.morning.common.service.shop.product.ao.QueryRecommendListAO;
import com.morning.common.service.shop.product.dto.GroupBuyDTO;
import com.morning.common.service.shop.product.dto.ReconmmendDTO;
import com.morning.common.service.shop.product.entity.GroupBuy;
import com.morning.common.service.shop.product.entity.Recommend;
import com.morning.shop.product.dao.GroupBuyMapper;
import com.morning.shop.product.dao.RecommendMapper;
import com.morning.shop.product.service.IGroupBuyService;
import com.morning.shop.product.service.IRecommendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 项目名称：morning-product-service
 * 类名称：RecommendServiceImpl
 * 类描述：Recommend / 推荐位表 业务逻辑层接口实现
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:17:47
 */
@Service("groupBuyService")
public class GroupBuyServiceImpl extends ServiceImpl<GroupBuyMapper, GroupBuy> implements IGroupBuyService {
    @Autowired
    private GroupBuyMapper groupBuyMapper;

    @Override
    public Page<GroupBuyDTO> queryGroupBuyListPage(QueryGroupBuyListAO query) {
        // 团购只显示两条
        Page page = new Page(query.getReqPage(),2);
        List<GroupBuyDTO> list=groupBuyMapper.queryGroupBuyListPage(page);
        page.setRecords(list);
        return page;
    }

}
