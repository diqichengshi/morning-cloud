package com.morning.shop.order.service.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.base.BasePageDTO;
import com.morning.common.base.MorningResult;
import com.morning.common.base.PageInfo;
import com.morning.common.base.exception.BusinessException;
import com.morning.common.base.exception.enums.ProductExceptionEnum;
import com.morning.common.constant.enums.OrderStatusEnum;
import com.morning.common.service.shop.order.ao.OrderCreateAO;
import com.morning.common.service.shop.order.ao.ProductOrderAO;
import com.morning.common.service.shop.order.entity.Order;
import com.morning.common.service.shop.order.entity.OrderProduct;
import com.morning.common.service.shop.order.entity.OrderShipment;
import com.morning.common.service.shop.order.vo.OrderShoppingCartVO;
import com.morning.common.service.shop.order.vo.OrderVO;
import com.morning.common.service.shop.product.vo.CartVO;
import com.morning.common.service.shop.product.vo.ShoppingCartVO;
import com.morning.common.service.shop.user.entity.Address;
import com.morning.shop.order.dao.OrderProductMapper;
import com.morning.shop.order.dao.OrderMapper;
import com.morning.shop.order.dao.OrderShipmentMapper;
import com.morning.shop.order.feign.IAddressServiceFeign;
import com.morning.shop.order.service.IOrderService;
import com.morning.shop.order.service.IShoppingCartService;
import com.morning.shop.order.util.RedisIdGenerator;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 项目名称：morning-order-service
 * 类名称：OrderServiceImpl
 * 类描述：Order / 订单表 业务逻辑层接口实现
 * 创建人：赵娟娟
 * 创建时间：2017年5月10日 上午10:35:40
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements IOrderService {

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderShipmentMapper orderShipmentMapper;
    @Autowired
    private OrderProductMapper orderProductMapper;
    @Autowired
    private RedisIdGenerator redisIdGenerator;
    @Autowired
    private IShoppingCartService shoppingCartService;
    @Autowired
    private IAddressServiceFeign addressServiceFeign;

    @Override
    public MorningResult<OrderVO> createOrder(OrderCreateAO orderCreateAO) {
        // 收货地址
        Address address = addressServiceFeign.queryAddress(orderCreateAO.getUserId(), orderCreateAO.getAddressId());
        if (address == null) {
            return MorningResult.error(ProductExceptionEnum.ADDRESS_NOT_EXIST);
        }
        OrderShipment orderShipment = new OrderShipment();
        BeanUtils.copyProperties(address, orderShipment);
        Order order = new Order();
        // 购物车选中商品
        CartVO cartVO = shoppingCartService.queryShoppingCart(orderCreateAO.getUserId());
        if (null == cartVO || cartVO.getShoppingCartVOList().isEmpty()) {
            return MorningResult.error(ProductExceptionEnum.CART_NOT_EXIST);
        }
        // 准备保存订单数据
        order.setBuyNumber(cartVO.getTotalNumber());// 订单总数量
        order.setOrderAmount(cartVO.getTotalPrice());// 订单总价格
        order.setOrderScore(cartVO.getTotalScore());// 订单总积分

        // 遍历购物车选中商品列表
        List<OrderShoppingCartVO> orderShoppingCartVOList = new ArrayList<OrderShoppingCartVO>();
        for (ShoppingCartVO vo : cartVO.getShoppingCartVOList()) {
            OrderShoppingCartVO orderShoppingCartVO = new OrderShoppingCartVO();
            BeanUtils.copyProperties(vo, orderShoppingCartVO);
            orderShoppingCartVOList.add(orderShoppingCartVO);
        }
        order.setUserId(orderCreateAO.getUserId());
        ProductOrderAO productOrderAO = new ProductOrderAO(order, orderShipment, orderShoppingCartVOList);
        String orderId = insertOrder(order, orderShipment, orderShoppingCartVOList);
        shoppingCartService.deleteProduct(orderCreateAO.getUserId(),""); // 从购物车中删除
        OrderVO orderVO = orderMapper.getOrder(orderCreateAO.getUserId(), orderId);
        return MorningResult.ok(orderVO);

    }

    public String insertOrder(Order order, OrderShipment orderShipment, List<OrderShoppingCartVO> shoppingCartVOList) {
        // 创建订单
        String orderId = redisIdGenerator.orderId();
        order.setCreateTime(new Date());
        order.setUpdateTime(new Date());
        //order.setUserId(userId);
        order.setOrderId(orderId);
        order.setPayAmount(order.getShipmentAmount().add(order.getOrderAmount()));
        order.setOrderStatus(OrderStatusEnum.SUBMIT_ORDERS.getStatus());
        orderMapper.insert(order);

        // 创建订单配送表
        orderShipment.setOrderId(order.getOrderId());
        order.setUpdateTime(new Date());
        orderShipmentMapper.insert(orderShipment);
        for (OrderShoppingCartVO shoppingCartVO : shoppingCartVOList) {
            OrderProduct orderProduct = new OrderProduct();
            orderProduct.setOrderProductId(redisIdGenerator.orderId());
            orderProduct.setOrderId(order.getOrderId());
            orderProduct.setProductId(shoppingCartVO.getProductId());
            orderProduct.setName(shoppingCartVO.getName());
            orderProduct.setPicImg(shoppingCartVO.getPicImg());
            orderProduct.setProductSpecAttrId(shoppingCartVO.getProductSpecAttrId());
            orderProduct.setProductSpecAttrName(shoppingCartVO.getProductSpecAttrName());
            orderProduct.setPrice(shoppingCartVO.getPrice());
            orderProduct.setScore(shoppingCartVO.getScore());
            orderProduct.setBuyNumber(shoppingCartVO.getBuyNumber());
            orderProduct.setProductScore(shoppingCartVO.getProductScore());
            orderProduct.setProductAmount(shoppingCartVO.getProductAmount());
            // 添加订单详情表
            orderProductMapper.insert(orderProduct);
        }

        return order.getOrderId();
    }

    @Override
    public BasePageDTO<OrderVO> list(String userId, PageInfo pageInfo, String search) {
        //pageInfo.setTotal(orderMapper.getCount(userId, search));
        List<OrderVO> orderVOList = orderMapper.list(userId, pageInfo, search);
        return new BasePageDTO<OrderVO>(pageInfo, orderVOList);
    }

    @Override
    public OrderVO getOrder(String userId, String orderId) {
        return orderMapper.getOrder(userId, orderId);
    }

    @Override
    public Order getByOrderId(String userId, String orderId, Integer status) {
        Order order = new Order();
        order.setOrderId(orderId);
        order.setUserId(userId);
        order.setOrderStatus(status);
        return orderMapper.selectOne(order);
    }

    @Override
    public Integer updateCancelOrder(String userId, String orderId) {
        Order queryOrder = new Order();
        queryOrder.setOrderId(orderId);
        queryOrder.setUserId(userId);
        queryOrder.setOrderStatus(OrderStatusEnum.SUBMIT_ORDERS.getStatus());
        Order order = orderMapper.selectOne(queryOrder);

        if (order != null) {
            order.setOrderStatus(OrderStatusEnum.MANUALLY_CANCEL_THE_ORDER.getStatus());
            order.setUpdateTime(new Date());
            return orderMapper.updateById(order);
        } else {
            throw new BusinessException(ProductExceptionEnum.ORDER_NOT_EXIST);
        }

    }

    @Override
    public Integer updateShipmentTime(String userId, String orderId, Integer shipmentTime) {
        Order queryOrder = new Order();
        queryOrder.setOrderId(orderId);
        queryOrder.setUserId(userId);
        queryOrder.setOrderStatus(OrderStatusEnum.SUBMIT_ORDERS.getStatus());
        Order order = orderMapper.selectOne(queryOrder);

        if (order != null) {
            order.setShipmentTime(shipmentTime);
            order.setUpdateTime(new Date());
            return orderMapper.updateById(order);

        } else {
            throw new BusinessException(ProductExceptionEnum.ORDER_NOT_EXIST);
        }
    }

}
