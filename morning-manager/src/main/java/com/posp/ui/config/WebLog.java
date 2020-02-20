package com.posp.ui.config;

import java.lang.annotation.*;

/**
 * @author: gaof
 * @create: 2018/9/13 23:23
 * @description: web ui 存储操作记录
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface WebLog {
	/**
     * 方法描述
     * @return
     */

    String value() default "";
	/**
     * 忽略
     */
    String[] ignores() default {};

    /**
     * 隐藏数据，带*,默认11位为手机号前3后4，其他前6后4
     * @return
     */
    String[] hides() default {};
    
    /**
     * reomve
     * @return
     */
    String[] removes() default {};
}
