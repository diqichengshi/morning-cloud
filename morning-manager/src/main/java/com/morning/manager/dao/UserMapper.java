package com.morning.manager.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.morning.manager.entity.Role;
import com.morning.manager.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.Map;
import java.util.Set;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public interface UserMapper extends BaseMapper<User> {

    User selectUserByMap(Map<String, Object> map);

    void saveUserRoles(@Param("userId") String id, @Param("roleIds") Set<Role> roles);

    void dropUserRolesByUserId(@Param("userId") String id);
}