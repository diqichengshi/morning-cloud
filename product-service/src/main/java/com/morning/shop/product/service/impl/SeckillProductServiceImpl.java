package com.morning.shop.product.service.impl;


import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.service.shop.product.ao.QueryGroupBuyListAO;
import com.morning.common.service.shop.product.ao.QuerySeckillProductListAO;
import com.morning.common.service.shop.product.dto.GroupBuyDTO;
import com.morning.common.service.shop.product.dto.SeckillProdcutDTO;
import com.morning.common.service.shop.product.entity.GroupBuy;
import com.morning.common.service.shop.product.entity.SeckillProdcut;
import com.morning.shop.product.dao.GroupBuyMapper;
import com.morning.shop.product.dao.SeckillProductMapper;
import com.morning.shop.product.service.IGroupBuyService;
import com.morning.shop.product.service.ISeckillProductService;
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
@Service("seckillProductService")
public class SeckillProductServiceImpl extends ServiceImpl<SeckillProductMapper, SeckillProdcut> implements ISeckillProductService {
    @Autowired
    private SeckillProductMapper seckillProductMapper;

    @Override
    public Page<SeckillProdcutDTO> querySeckillProductListPage(QuerySeckillProductListAO query) {
        Page page = new Page(query.getReqPage(),query.getReqSize());
        List<SeckillProdcutDTO> list=seckillProductMapper.querySeckillProductListPage(page);
        page.setRecords(list);
        return page;
    }

}
