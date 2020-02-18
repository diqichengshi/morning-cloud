package com.morning.common.service.shop.order.ao;

import java.io.Serializable;
import java.util.List;

import com.morning.common.service.shop.order.entity.Order;
import com.morning.common.service.shop.order.entity.OrderShipment;
import com.morning.common.service.shop.order.vo.OrderShoppingCartVO;

import lombok.Data;
@Data
public class ProductOrderAO implements Serializable{

	private static final long serialVersionUID = 1L;
	private String userId;
	private String addressId;
	private Order order;
	private OrderShipment orderShipment;
	private List<OrderShoppingCartVO> orderShoppingCartVOList;

	public ProductOrderAO() {
	}

	public ProductOrderAO(Order order, OrderShipment orderShipment, List<OrderShoppingCartVO> orderShoppingCartVOList) {
		this.order = order;
		this.orderShipment = orderShipment;
		this.orderShoppingCartVOList = orderShoppingCartVOList;
	}
}
