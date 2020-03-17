package com.morning.shop.order.feign;

import com.morning.common.service.shop.user.entity.Address;
import com.morning.shop.order.feign.impl.AddressServiceFeignImpl;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(name = "morning-user-service", fallback = AddressServiceFeignImpl.class)
public interface IAddressServiceFeign {
    
    @GetMapping("/shop/queryAddress")
    Address queryAddress(@RequestParam("userId") String userId, String addressId);
    
}
