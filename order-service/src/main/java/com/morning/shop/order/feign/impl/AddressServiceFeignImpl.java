package com.morning.shop.order.feign.impl;

import com.morning.common.service.shop.user.entity.Address;
import com.morning.shop.order.feign.IAddressServiceFeign;
import org.springframework.stereotype.Component;

@Component
public class AddressServiceFeignImpl implements IAddressServiceFeign {
    @Override
    public Address queryAddress(String userId, String addressId) {
        return null;
    }
}
