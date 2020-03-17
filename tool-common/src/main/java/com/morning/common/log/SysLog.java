package com.morning.common.log;
import java.lang.annotation.*;

/**
 * 打印文本日志注解,包含request的Controller或者feign调用
 *
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SysLog {
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
     * 是否在返回类中打印返回数据，RespMsgDTO中的data属性
     * @return false:不打印,true:打印
     */
    boolean isPrint() default true;
}
