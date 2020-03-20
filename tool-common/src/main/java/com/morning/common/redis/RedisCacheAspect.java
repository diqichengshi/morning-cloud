package com.morning.common.redis;

import com.morning.common.util.JsonUtil;
import com.morning.common.util.StringUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.core.DefaultParameterNameDiscoverer;
import org.springframework.core.ParameterNameDiscoverer;
import org.springframework.core.annotation.Order;
import org.springframework.expression.EvaluationContext;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.lang.reflect.Method;
import java.util.List;

//开启AspectJ 自动代理模式,如果不填proxyTargetClass=true，默认为false，
@EnableAspectJAutoProxy(proxyTargetClass = true)
@Component
@Order(-1)
@Aspect
@Slf4j
public class RedisCacheAspect {
    /**
     * SPEL表达式解析器
     */
    private static final ExpressionParser EXPRESSION_PARSER = new SpelExpressionParser();

    /**
     * 获取方法参数名称发现器
     */
    private static final ParameterNameDiscoverer PARAMETER_NAME_DISCOVERER = new DefaultParameterNameDiscoverer();


    /**
     * 这块可配置，每个公司都要自己的缓存配置方式，到时候可配置自己公司所用的缓存框架和配置方式
     */
    @Resource
    private RedisService redisService;

    /**
     * 切面切入点
     */
    @Pointcut("@annotation(com.morning.common.redis.RedisCache)")
    public void mergeDuplicationRequest() {

    }

    /**
     * 环绕切面
     */
    @Around("mergeDuplicationRequest()")
    public Object handleControllerMethod(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        //获取controller对应的方法.
        MethodSignature methodSignature = (MethodSignature) proceedingJoinPoint.getSignature();
        //获取方法
        Method method = methodSignature.getMethod();

        //获取注解
        RedisCache annotation = method.getAnnotation(RedisCache.class);
        //获取缓存key的表达式,并根据上下文等数据计算表达式
        String cacheKey = parseKey(annotation.key(), proceedingJoinPoint);
        int seconds = annotation.expireSeconds();
        //先尝试从redis里获取数据(字节)
        String redisValue = redisService.getString(cacheKey);

        if (StringUtil.isNotBlank(redisValue)) {
            log.info("key={}命中缓存,value={}",cacheKey,redisValue);
            //redis有数据,直接返回
            Object object=JsonUtil.toPojo(redisValue,Object.class);
            if (null !=object){
                return object;
            }
        }

        //redis没有数据,则调用原方法,获取结果值
        Object result = proceedingJoinPoint.proceed();
        if (result instanceof List){
            List list= (List) result;
            if (list.size()==0){
                log.info("key={}未命中缓存,查询结果为空,不向缓存添加",cacheKey);
                return result;
            }
        }
        redisValue=JsonUtil.toJsonStr(result);
        log.info("key={}未命中缓存,向缓存添加,value={}",cacheKey,redisValue);
        redisService.setString(cacheKey,redisValue);

        return result;
    }

    /**
     * 计算spel表达式
     *
     * @param expression 表达式
     * @param context    上下文
     * @return String的缓存key
     */
    private static String parseKey(String expression, JoinPoint context) {
        //获取切入点的方法信息
        MethodSignature methodSignature = (MethodSignature) context.getSignature();
        Method method = methodSignature.getMethod();

        // 获取传入参数值
        Object[] args = context.getArgs();
        if (args == null || args.length == 0) {
            // 无参传入,直接计算表达式(无需参数上下文)
            return EXPRESSION_PARSER.parseExpression(expression).getValue(String.class);
        }

        // 获取参数名
        String[] parameterNames = PARAMETER_NAME_DISCOVERER.getParameterNames(method);
        if (parameterNames.length > args.length) {
            //由于java不允许有匿名参数,所以如果参数名多于参数值,则必为非法
            log.error("参数值的长度少于参数名长度, 方法:{}, 参数名长度: {},参数值长度:{}", method, parameterNames.length, args.length);
            throw new IllegalArgumentException("参数传入不足");
        }

        // 将参数名与参数值放入参数上下文
        EvaluationContext evaluationContext = new StandardEvaluationContext();
        for (int i = 0; i < parameterNames.length; i++) {
            evaluationContext.setVariable(parameterNames[i], args[i]);
        }

        // 计算表达式(根据参数上下文)
        String cacheKey =EXPRESSION_PARSER.parseExpression(expression).getValue(evaluationContext, String.class);
        return cacheKey;
    }

}
