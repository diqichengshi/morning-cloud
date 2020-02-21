package com.lzhpo.common.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    @Override
    public void insertFill(MetaObject metaObject) {
        setFieldValByName("createDate", new Date(), metaObject);
        setFieldValByName("createId", MySysUser.id(), metaObject);
        setFieldValByName("updateDate", new Date(), metaObject);
        setFieldValByName("updateId", MySysUser.id(), metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        setFieldValByName("updateDate", new Date(), metaObject);
        setFieldValByName("updateId", MySysUser.id(), metaObject);
    }
}
