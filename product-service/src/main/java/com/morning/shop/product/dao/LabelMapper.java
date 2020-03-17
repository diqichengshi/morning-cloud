package com.morning.shop.product.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.morning.common.service.shop.product.entity.Label;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目名称：morning-product-service
 * 类名称：LabelMapper
 * 类描述：Label / 商品标签表 数据访问层接口
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:14:49
 */
@Mapper
public interface LabelMapper extends BaseMapper<Label> {

}