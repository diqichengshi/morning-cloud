package com.morning.shop.product.service.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.service.shop.product.entity.Label;
import com.morning.shop.product.dao.LabelMapper;
import com.morning.shop.product.service.ILabelService;
import org.springframework.stereotype.Service;

/**
 * 项目名称：morning-product-service
 * 类名称：LabelServiceImpl
 * 类描述：Label / 商品标签表 业务逻辑层接口实现
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:16:54
 */
@Service("labelService")
public class LabelServiceImpl extends ServiceImpl<LabelMapper, Label> implements ILabelService {

}
