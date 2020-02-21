package com.morning.manager.common.config;

import com.morning.manager.common.realm.AuthRealm;
import org.apache.shiro.SecurityUtils;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public class MySysUser {

    /**
     * 取出Shiro中的当前用户LoginName.
     */
    public static String icon() {
        return ShiroUser().getIcon();
    }

    public static String id() {
        return ShiroUser().getId();
    }

    public static String loginName() {
        return ShiroUser().getloginName();
    }

    public static String nickName() {
        return ShiroUser().getNickName();
    }

    public static AuthRealm.ShiroUser ShiroUser() {
        AuthRealm.ShiroUser user = (AuthRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        return user;
    }
}
