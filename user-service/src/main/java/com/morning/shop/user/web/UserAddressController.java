package com.morning.shop.user.web;

import com.morning.common.base.MorningResult;
import com.morning.common.service.shop.user.entity.Address;
import com.morning.shop.user.service.IAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * 项目名称：morning-os-web Maven Webapp
 * 类名称：UserInfoController
 * 类描述：后台中心-个人中心表示层控制器
 * 创建人：赵娟娟
 * 创建时间：2017年5月9日 下午5:27:30
 */
@Controller
@RequestMapping(value = "/user")
public class UserAddressController {
    @Autowired
    private IAddressService addressService;

    /**
     * GET 收货地址,不分页
     *
     * @return
     */
    @GetMapping(value = "/addressList")
    @ResponseBody
    public MorningResult<List<Address>> addressList(@RequestParam("userId") String userId) {
        List<Address> addressList = addressService.queryAddressList(userId);
        return MorningResult.ok(addressList);
    }

    /**
     * POST 根据url传过来的收货地址信息创建收货地址
     *
     * @return
     */
    @PostMapping(value = "/address")
    @ResponseBody
    public MorningResult addressCreate(@RequestParam("address") Address address) {
        addressService.insertAddress(address);
        return MorningResult.ok();
    }

    /**
     * PUT 根据url传过来的收获地址ID和收货地址信息更新收货地址
     *
     * @return
     */
    @PutMapping(value = "/address")
    @ResponseBody
    public MorningResult addressUpdate(Address address) {
        addressService.updateAddress(address.getUserId(), address);
        return MorningResult.ok();
    }

    /**
     * DELETE 根据url传过来的地址ID删除收货地址
     *
     * @return
     */
    @DeleteMapping(value = "/address")
    @ResponseBody
    public MorningResult addressDelete(@RequestParam("userId") String userId, @RequestParam("addressId") String addressId) {
        addressService.deleteByAddressId(userId, addressId);
        return MorningResult.ok();
    }

    /**
     * GET 查询收货地址
     *
     * @return
     */
    @GetMapping(value = "/queryAddress")
    @ResponseBody
    public MorningResult queryAddress(@RequestParam("userId") String userId, @RequestParam("addressId") String addressId) {
        Address address = addressService.getAddress(userId, addressId);
        return MorningResult.ok(address);
    }
}
