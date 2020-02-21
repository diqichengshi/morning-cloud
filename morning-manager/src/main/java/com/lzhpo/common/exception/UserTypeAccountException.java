package com.lzhpo.common.exception;

import org.apache.shiro.authc.DisabledAccountException;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public class UserTypeAccountException extends DisabledAccountException {

    public UserTypeAccountException() {
        super();
    }

}
