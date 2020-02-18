package com.morning.shop.user.service.impl;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.service.shop.user.entity.Address;
import com.morning.shop.user.dao.AddressMapper;
import com.morning.shop.user.service.IAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 项目名称：morning-user-service
 * 类名称：AddressServiceImpl
 * 类描述：Address / 收获地址表 业务逻辑层接口实现
 * 创建人：赵娟娟
 * 创建时间：2017年5月9日 下午9:59:19
 */
@Service("addressService")
public class AddressServiceImpl extends ServiceImpl<AddressMapper, Address> implements IAddressService {

    @Autowired
    private AddressMapper addressMapper;

    @Override
    public Integer insertAddress(Address address) {
        address.setCreateTime(new Date());
        return addressMapper.insert(address);
    }

    @Override
    public List<Address> queryAddressList(String userId) {
        Address query=new Address();
        query.setUserId(userId);
        EntityWrapper entityWrapper=new EntityWrapper(query);
        List<Address> addressList=addressMapper.selectList(entityWrapper);
        return addressList;
    }

    @Override
    public List<Address> listAddress(String userId) {
        Address address = new Address();
        address.setUserId(userId);
        return addressMapper.selectList(new EntityWrapper<Address>(address));
    }

    @Override
    public Address getAddress(String userId, String addressId) {
        Address address = new Address();
        address.setUserId(userId);
        address.setAddressId(addressId);
        return addressMapper.selectOne(address);
    }

    @Override
    public Integer updateAddress(String userId, Address address) {
        Address queryAddress = new Address();
        queryAddress.setUserId(userId);
        queryAddress.setAddressId(address.getAddressId());
        Address resultAddress = addressMapper.selectOne(queryAddress);
        if (resultAddress != null) {
            address.setAddressId(resultAddress.getAddressId());
            address.setUserId(queryAddress.getUserId());
            address.setUpdateTime(new Date());
            return addressMapper.updateById(address);
        }
        // TODO 抛出一个收货地址不存在的异常
        return null;
    }

    @Override
    public Integer deleteByAddressId(String userId, String addressId) {
        Address address = new Address();
        address.setUserId(userId);
        address.setAddressId(addressId);
        return addressMapper.delete(new EntityWrapper<>(address));
    }

}
