package com.morning.common.redis;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * redis缓存注解
 * 仅支持方法
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface RedisCache {
    /**
     * @return 缓存的key值
     * 对应的Method的返回值必须 实现 Serializable 接口
     *
     */
    String key();

    /**
     * 到期秒数
     *
     * @return 到期秒数
     */
    int expireSeconds() default 20;
}
