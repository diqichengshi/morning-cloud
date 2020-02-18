package com.morning.shop.user.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.morning.common.service.shop.user.entity.Address;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目名称：morning-user-service
 * 类名称：AddressMapper
 * 类描述：Address / 收获地址表 数据访问层接口
 * 创建人：赵娟娟
 * 创建时间：2017年5月9日 下午9:59:34
 */
@Mapper
public interface AddressMapper extends BaseMapper<Address> {
}