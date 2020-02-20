package com.posp.ui.config;


import java.lang.annotation.Annotation;
import java.lang.reflect.Method;

import com.posp.tool.common.data.HideDataUtil;
import org.aspectj.lang.JoinPoint;

import com.alibaba.fastjson.JSONObject;


/**
 * @author: gaof
 * @create: 2018/7/11 19:04
 * @Description: 文本日志打印工具类
 */
public class WebLogUtil {
	
    /**
     * 设置明感数据，带*打印
     *
     * @param jsonObject
     * @param paramName  参数名称
     * @param value      参数值
     * @param hides      敏感数据参数名称数组
     * @return
     */
    public static JSONObject setHideParam(JSONObject jsonObject, String paramName, String value, String[] hides) {
        if (hides.length == 0) {
            return jsonObject;
        }
        for (String n : hides) {
            if (paramName.indexOf(n) >= 0) {
                /*使用固定一种模式处理敏感数据，手机号，卡号，证件号
                粗暴的判断一下，长度等于11的认为是手机号*/
                if (11 == value.length()) {
                    jsonObject.put(paramName, HideDataUtil.hidePhoneNo(value));
                } else {
                    jsonObject.put(paramName, HideDataUtil.hideCardNo(value));
                }
                return jsonObject;
            }
        }
        return jsonObject;
    }

    /**
     * 设置忽略打印的参数，即不打印参数值
     *
     * @param jsonObject
     * @param paramName  参数名称
     * @param value      参数值
     * @param ignores    忽略数据参数名称数组
     * @return
     */
    public static JSONObject setIgnoreParam(JSONObject jsonObject, String paramName, String value, String[] ignores) {
        if (ignores.length == 0) {
            return jsonObject;
        }
        for (String n : ignores) {
            if (paramName.indexOf(n) >= 0) {
                jsonObject.put(paramName, "------");
                return jsonObject;
            }
        }
        return jsonObject;
    }
    
    /**
     * 删除
     *
     * @param jsonObject
     * @param paramName  参数名称
     * @param value      参数值
     * @param ignores    忽略数据参数名称数组
     * @return
     */
    public static JSONObject setRemoveParam(JSONObject jsonObject, String paramName, String value, String[] ignores) {
        if (ignores.length == 0) {
            return jsonObject;
        }
        for (String n : ignores) {
            if (paramName.indexOf(n) >= 0) {
                jsonObject.remove(paramName);
                return jsonObject;
            }
        }
        return jsonObject;
    }

    /**
     * 获取注解的忽略打印列表
     *
     * @param joinPoint
     * @return
     */
    public static String[] getWebLogIgnores(JoinPoint joinPoint) {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class targetClass = null;
        try {
            targetClass = Class.forName(targetName);
        } catch (ClassNotFoundException e) {
            return null;
        }
        Method[] methods = targetClass.getMethods();
        ;
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    Annotation annotation = method.getAnnotation(WebLog.class);
                    if (annotation != null) {
                        String[] ignores = method.getAnnotation(WebLog.class).ignores();
                        return ignores;
                    }
                }
            }
        }
        return null;
    }

    /**
     * 获取注解的隐藏数据列表
     *
     * @param joinPoint
     * @return
     */
    public static String[] getWebLogHides(JoinPoint joinPoint) {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class targetClass = null;
        try {
            targetClass = Class.forName(targetName);
        } catch (ClassNotFoundException e) {
            return null;
        }
        Method[] methods = targetClass.getMethods();
        ;
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    Annotation annotation = method.getAnnotation(WebLog.class);
                    if (annotation != null) {
                        String[] hides = method.getAnnotation(WebLog.class).hides();
                        return hides;
                    }
                }
            }
        }
        return null;
    }
    
    /**
     * 获取注解的隐藏数据列表
     *
     * @param joinPoint
     * @return
     */
    public static String[] getWebLogRemoves(JoinPoint joinPoint) {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class targetClass = null;
        try {
            targetClass = Class.forName(targetName);
        } catch (ClassNotFoundException e) {
            return null;
        }
        Method[] methods = targetClass.getMethods();
        ;
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    Annotation annotation = method.getAnnotation(WebLog.class);
                    if (annotation != null) {
                        String[] hides = method.getAnnotation(WebLog.class).removes();
                        return hides;
                    }
                }
            }
        }
        return null;
    }
}

