package com.morning.manager.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.morning.manager.entity.Role;
import com.morning.manager.entity.User;

import java.util.Set;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public interface UserService extends IService<User> {

    User findUserByLoginName(String name);

    User findUserById(String id);

    int userCount(String loginName);

    void saveUserRoles(String id, Set<Role> roleLists);

    void saveUser(User user);

    void updateUser(User user);

    void deleteUser(User user);

    void lockUser(User user);
}
