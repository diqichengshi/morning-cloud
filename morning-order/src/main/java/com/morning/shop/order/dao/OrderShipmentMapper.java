package com.morning.shop.order.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.morning.common.service.shop.order.entity.OrderShipment;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目名称：morning-order-service
 * 类名称：OrderShipmentMapper
 * 类描述：OrderShipment / 订单配送表 数据访问层接口
 * 创建人：赵娟娟
 * 创建时间：2017年5月10日 上午10:33:52
 */
@Mapper
public interface OrderShipmentMapper extends BaseMapper<OrderShipment> {

}