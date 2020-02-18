package com.morning.common.service.shop.order.ao;

import com.morning.common.service.shop.order.entity.Order;
import com.morning.common.service.shop.order.entity.OrderShipment;
import com.morning.common.service.shop.order.vo.OrderShoppingCartVO;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class OrderCreateAO implements Serializable{

	private static final long serialVersionUID = 1L;
	private String userId;
	private String addressId;

}
