package com.morning.shop.order.service.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.service.shop.order.entity.OrderShipment;
import com.morning.shop.order.dao.OrderShipmentMapper;
import com.morning.shop.order.service.IOrderShipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 项目名称：morning-order-service
 * 类名称：OrderShipmentServiceImpl
 * 类描述：OrderShipment / 订单配送表 业务逻辑层接口实现
 * 创建人：赵娟娟
 * 创建时间：2017年5月10日 上午10:34:55
 */
@Service
public class OrderShipmentServiceImpl extends ServiceImpl<OrderShipmentMapper, OrderShipment> implements IOrderShipmentService {

    @Autowired
    private OrderShipmentMapper orderShipmentMapper;

    @Override
    public OrderShipment getByOrderId(String orderId) {
        OrderShipment orderShipment = new OrderShipment();
        orderShipment.setOrderId(orderId);
        return orderShipmentMapper.selectOne(orderShipment);
    }

    @Override
    public Integer updateOrderShipment(OrderShipment orderShipment) {
        // TODO 根据订单号以及用户ID以及订单状态查找该订单是否存在,如存在则修改配送地址信息,若不存在,则抛出异常
        return orderShipmentMapper.updateById(orderShipment);
    }
}
