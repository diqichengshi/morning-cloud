package com.morning.shop.order.web;


import java.util.Map;

import com.morning.common.base.exception.enums.ProductExceptionEnum;
import com.morning.common.constant.enums.OrderStatusEnum;
import com.morning.common.service.shop.order.ao.OrderCreateAO;
import org.apache.commons.lang.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.morning.common.base.BasePageDTO;
import com.morning.common.base.MorningResult;
import com.morning.common.base.PageInfo;
import com.morning.common.service.shop.order.entity.Order;
import com.morning.common.service.shop.order.entity.OrderShipment;
import com.morning.common.service.shop.order.vo.OrderVO;
import com.morning.shop.order.service.IOrderService;
import com.morning.shop.order.service.IOrderShipmentService;

/**
 * 项目名称：morning-os-web Maven Webapp
 * 类名称：OrderBuyController
 * 类描述：商品购买表示层控制器
 * 创建人：赵娟娟
 * 创建时间：2017年5月10日 下午11:08:49
 */
@Controller
@RequestMapping(value = "/order")
public class OrderController {

    @Autowired
    private IOrderService orderService;
    @Autowired
    private IOrderShipmentService orderShipmentService;

    /**
     * POST 提交订单
     *
     * @return
     */
    @PostMapping(value = "/create")
    @ResponseBody
    public MorningResult<OrderVO> createOrder(@RequestBody OrderCreateAO orderCreateAO) {
        MorningResult<OrderVO> morningResult = orderService.createOrder(orderCreateAO);
        return morningResult;
    }

    /**
     * PUT 根据URL传过来的订单编号取消订单
     *
     * @return
     */
    @PutMapping(value = "/cancelOrder")
    @ResponseBody
    public Object cancelOrder(@RequestParam("userId") String userId, @RequestParam(value = "orderId") String orderId) {
        Integer count = orderService.updateCancelOrder(userId, orderId);
        return MorningResult.ok(count);
    }

    /**
     * PUT 根据URL传过来的订单编号修改送货时间
     *
     * @return
     */
    @PutMapping(value = "/time")
    @ResponseBody
    public Object timeOrder(@RequestParam("userId") String userId, @RequestParam(value = "orderId") String orderId,
                            @RequestParam(value = "shipmentTime") Integer shipmentTime) {
        Integer count = orderService.updateShipmentTime(userId, orderId, shipmentTime);
        return MorningResult.ok(count);
    }

    /**
     * PUT 根据URL传过来的收货地址信息修改收货地址
     *
     * @return
     */
    @PutMapping(value = "/shipment")
    @ResponseBody
    public Object orderShipment(OrderShipment orderShipment) {
        Integer count = orderShipmentService.updateOrderShipment(orderShipment);
        return MorningResult.ok(count);
    }

    /**
     * GET 我的订单
     *
     * @param model
     * @return
     */
    @GetMapping(value = "/list")
    public MorningResult list(@RequestParam("userId") String userId, @RequestParam Map<String, Object> params) {
        String search = ObjectUtils.toString(params.get("search"));
        //PageInfo pageInfo = PageInfo.buildPageInfo(0, 10);
        // BasePageDTO<OrderVO> basePageDTO = orderService.list(userId, pageInfo, search);

        return MorningResult.ok(null);
    }

    /**
     * GET 订单详情
     *
     * @param model
     * @param orderNumber
     * @return
     */
    @GetMapping(value = "/orderView")
    public MorningResult orderView(@RequestParam("userId") String userId, @RequestParam("orderId") String orderId) {
        OrderVO orderVO = orderService.getOrder(userId, orderId);
        return MorningResult.ok(orderVO);
    }
}
