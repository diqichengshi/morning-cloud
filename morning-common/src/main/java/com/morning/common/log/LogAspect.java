package com.morning.common.log;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

/**
 * 服务切点打印日志
 *
 * @author 高峰
 * @version v1.0.1, 2018/09/12  01:50:53 下午
 */
@Aspect
@Component
public class LogAspect {
    ThreadLocal<Long> startTime = new ThreadLocal<>();

    /**
     * 返回
     *
     * @param ret
     * @throws Throwable
     * @version v1.0.1, 2018/09/12  01:50:53 下午
     * @author 高峰
     */
    @AfterReturning(
            returning = "ret",
            pointcut = "logPoint()"
    )
    public void doAfterReturning(JoinPoint joinPoint, Object ret) throws Throwable {
        LogUtil.log(ret, startTime, joinPoint);
        // 必须回收自定义的ThreadLocal变量，尤其在线程池场景下，线程经常会被复用，如果不清理自定义的 ThreadLocal变量，可能会影响后续业务逻辑和造成内存泄露等问题。尽量在代理中使用try-finally块进行回收。
        startTime.remove();
    }

    /**
     * 请求
     *
     * @param joinPoint
     * @throws Throwable
     * @version v1.0.1, 2018/09/12  01:50:53 下午
     * @author 高峰
     */
    @Before("logPoint()")
    public void doBefore(JoinPoint joinPoint) throws Throwable {
        startTime.set(System.currentTimeMillis());
        LogUtil.log(joinPoint);
    }

    /**
     * 触发点
     *
     * @version v1.0.1, 2018/09/12  01:50:53 下午
     * @author 高峰
     */
    @Pointcut("@annotation(com.morning.common.log.SysLog)")
    public void logPoint() {
    }
}
