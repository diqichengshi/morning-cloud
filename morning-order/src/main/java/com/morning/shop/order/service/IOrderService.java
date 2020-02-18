package com.morning.shop.order.service;

import com.morning.common.base.MorningResult;
import com.morning.common.base.PageInfo;
import com.baomidou.mybatisplus.service.IService;
import com.morning.common.base.BasePageDTO;
import com.morning.common.service.shop.order.ao.OrderCreateAO;
import com.morning.common.service.shop.order.entity.Order;
import com.morning.common.service.shop.order.entity.OrderShipment;
import com.morning.common.service.shop.order.vo.OrderShoppingCartVO;
import com.morning.common.service.shop.order.vo.OrderVO;

import java.util.List;

/**
 * 项目名称：morning-order-facade
 * 类名称：IOrderService
 * 类描述：Order / 订单表 业务逻辑层接口
 * 创建人：赵娟娟
 * 创建时间：2017年5月10日 上午10:31:08
 */
public interface IOrderService extends IService<Order> {
    /**
     * 根据订单信息创建订单
     *
     * @param order           订单信息
     * @param orderShipment   订单配送信息
     * @param shoppingCartVOs 购物车商品列表
     * @param userId          用户ID
     * @return
     */
    MorningResult<OrderVO> createOrder(OrderCreateAO orderCreateAO);


    /**
     * 根据用户ID、订单状态列表、分页信息、搜索内容查找订单列表
     *
     * @param userId    用户ID
     * @param pageInfo  分页信息
     * @param typeValue 订单状态列表
     * @param search    搜索内容
     * @return
     */
    BasePageDTO<OrderVO> list(String userId, PageInfo pageInfo, String search);

    /**
     * 根据用户ID、订单编号查找订单信息
     *
     * @param userId      用户ID
     * @param orderNumber 订单编号
     * @return
     */
    OrderVO getOrder(String userId, String orderId);

    /**
     * 根据订单编号,用户ID,订单状态查找订单信息
     *
     * @param orderNumber 订单编号
     * @param userId      用户ID
     * @param orderStatus 订单状态
     * @return
     */
    Order getByOrderId(String userId, String orderId, Integer status);

    /**
     * 根据订单编号,用户ID取消订单
     *
     * @param orderNumber 订单编号
     * @param userId      用户ID
     * @return
     */
    Integer updateCancelOrder(String userId, String orderId);

    /**
     * 根据订单编号,用户ID,送货时间类型修改送货时间
     *
     * @param orderNumber  订单编号
     * @param shipmentTime 送货时间
     * @param userId       用户ID
     * @return
     */
    Integer updateShipmentTime(String userId, String orderId, Integer shipmentTime);

}
