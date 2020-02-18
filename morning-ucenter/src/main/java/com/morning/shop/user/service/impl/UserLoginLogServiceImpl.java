package com.morning.shop.user.service.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.service.shop.user.entity.UserLoginLog;
import com.morning.shop.user.dao.UserLoginLogMapper;
import com.morning.shop.user.service.IUserLoginLogService;
import org.springframework.stereotype.Service;

/**
 * 项目名称：morning-user-service
 * 类名称：UserLoginLogServiceImpl
 * 类描述：UserLoginLog / 用户登录表 业务逻辑层接口实现
 * 创建人：赵娟娟
 * 创建时间：2017年4月8日 下午2:16:47
 */
@Service("userLoginLogService")
public class UserLoginLogServiceImpl extends ServiceImpl<UserLoginLogMapper, UserLoginLog> implements IUserLoginLogService {

}
