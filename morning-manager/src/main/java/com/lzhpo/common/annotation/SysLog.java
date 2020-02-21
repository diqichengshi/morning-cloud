package com.lzhpo.common.annotation;

import java.lang.annotation.*;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SysLog {
    String value() default "";
}
