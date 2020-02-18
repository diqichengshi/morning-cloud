package com.morning.shop.order.service;

import com.baomidou.mybatisplus.service.IService;
import com.morning.common.service.shop.order.entity.OrderShipment;

/**
 * 项目名称：morning-order-facade
 * 类名称：IOrderShipmentService
 * 类描述：OrderShipment / 订单配送表 业务逻辑层接口
 * 创建人：赵娟娟
 * 创建时间：2017年5月10日 上午10:31:24
 */
public interface IOrderShipmentService extends IService<OrderShipment> {

    /**
     * 根据订单ID查找订单配送信息
     *
     * @param orderId 订单ID
     * @return
     */
    OrderShipment getByOrderId(String orderId);

    /**
     * 更新订单配送信息
     *
     * @param orderShipment 订单配送信息
     * @param userId        用户ID
     * @return
     */
    Integer updateOrderShipment(OrderShipment orderShipment);

}
