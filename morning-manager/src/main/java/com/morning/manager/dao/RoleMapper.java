package com.morning.manager.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.morning.manager.entity.Menu;
import com.morning.manager.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.Set;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public interface RoleMapper extends BaseMapper<Role> {

    void saveRoleMenus(@Param("roleId") String roleId, @Param("menus") Set<Menu> menuSet);

    Role selectRoleById(@Param("roleId") String roleId);

    void dropRoleMenus(@Param("roleId") String roleId);

    void dropRoleUsers(@Param("roleId") String roleId);
}