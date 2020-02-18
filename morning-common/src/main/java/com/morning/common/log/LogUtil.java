package com.morning.common.log;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.morning.common.base.MorningResult;
import com.morning.common.constant.ShopConstant;
import com.morning.common.constant.enums.HttpMethodEnum;
import com.morning.common.util.StringUtil;
import com.morning.common.util.ClassUtil;
import com.morning.common.util.HideDataUtil;
import com.netflix.zuul.context.RequestContext;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.util.StreamUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.Charset;
import java.util.*;

/**
 * @author: gaof
 * @create: 2018/7/11 19:04
 * @Description: 文本日志打印工具类
 */
@Slf4j
public class LogUtil {

    /**
     * 打印请求头-[无描述]
     *
     * @param uri    uri
     * @param ip     客户端ip
     * @param method 请求方法
     */
    public static void logHeader(String uri, String ip, String method) {
        logHeader(uri, ip, method, null);
    }

    /**
     * 打印请求头-格式化数据
     *
     * @param uri         uri
     * @param ip          客户端ip
     * @param method      请求方法
     * @param description 方法描述
     */
    public static void logHeader(String uri, String ip, String method, String description) {
        if (log.isInfoEnabled()) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("ip", ip);
            jsonObject.put("method", method);
            jsonObject.put("uri", uri);
            jsonObject.put("desc", description);
            log.info("Request:{}", jsonObject.toString());
        }
    }

    /**
     * 打印请求头-aop切点
     *
     * @param joinPoint aop切点
     */
    public static void logHeader(JoinPoint joinPoint) {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        String description = getSysLogDescription(joinPoint);
        logHeader(request, description);
    }

    /**
     * 打印处理请求的Controller名称+方法名
     *
     * @param joinPoint aop切点
     */
    public static void logClass(JoinPoint joinPoint) {
        String className = joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName();
        log.info("Request[class]:{}()", className);
    }

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
            if (n.equals(paramName)) {
                /*使用固定一种模式处理敏感数据，手机号，卡号，证件号
                粗暴的判断一下，长度等于11的认为是手机号*/
                if (11 == value.length()) {
                    jsonObject.put(n, HideDataUtil.hidePhoneNo(value));
                } else {
                    jsonObject.put(n, HideDataUtil.hideCardNo(value));
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
            if (n.equals(paramName)) {
                jsonObject.put(n, "------");
                return jsonObject;
            }
        }
        return jsonObject;
    }

    /**
     * 打印处理类和方法名称以及参数
     *
     * @param joinPoint AOP切点
     */
    public static void logClassArgs(JoinPoint joinPoint) {
        String className = joinPoint.getSignature().getDeclaringTypeName();
        String methodName = joinPoint.getSignature().getName();
        Object[] list = joinPoint.getArgs();
        String[] ignores = getSysLogIgnores(joinPoint);
        String[] hides = getSysLogHides(joinPoint);

//        List<String> argsList = new ArrayList<>();
        JSONObject jsonObject = new JSONObject();
        for (int k = 0; k < list.length; k++) {
            Object object = list[k];
            if (object.getClass()
                    .toString()
                    .equalsIgnoreCase("class org.springframework.validation.BeanPropertyBindingResult")) {
                continue;
                //基本类型及包装类的处理，不全，后继在补充
            } else if (object instanceof String) {
                String[] argNames = ((MethodSignature) joinPoint.getSignature()).getParameterNames();
//                JSONObject jsonObject = new JSONObject();
                jsonObject.put(argNames[k], object.toString());
                setHideParam(jsonObject, argNames[k], object.toString(), hides);
                setIgnoreParam(jsonObject, argNames[k], object.toString(), ignores);
//                argsList.add(jsonObject.toJSONString());
                //Map类型主要在web-ui工程上
            } else if (object instanceof Map) {
//                JSONObject jsonObject = new JSONObject();
                Map<String, Object> map = (Map) object;
                for (Map.Entry<String, Object> entry : map.entrySet()) {
                    //空值的参数不打印
                    if (null != entry.getValue()) {
                        jsonObject.put(entry.getKey(), entry.getValue());
                        setHideParam(jsonObject, entry.getKey(), entry.getValue().toString(), hides);
                        setIgnoreParam(jsonObject, entry.getKey(), entry.getValue().toString(), ignores);
                    }
                }
//                argsList.add(jsonObject.toJSONString());
            } else {
                //处理敏感数据和忽略数据
//                JSONObject jsonObject = new JSONObject();
                //获取对象的属性名列表
//                Field[] fields = object.getClass().getDeclaredFields();
                Field[] fields = ClassUtil.getDeclaredField(object);
                for (int i = 0; i < fields.length; i++) {
                    //获取参数
                    Object value = ClassUtil.getFieldValueByName(fields[i].getName(), object);
                    if (null != value) {
                        jsonObject.put(fields[i].getName(), value.toString());
                        setHideParam(jsonObject, fields[i].getName(), value.toString(), hides);
                        setIgnoreParam(jsonObject, fields[i].getName(), value.toString(), ignores);
                    }
                }
//                argsList.add(jsonObject.toJSONString());
            }
        }
        if (log.isInfoEnabled()) {
        	String tmp = jsonObject.toJSONString();
        	tmp = cutLogOfList(tmp);
            log.info("Request[{}#{}]:{}", className, methodName, tmp);
        }
    }
    
    /**
     * 打印请求头-请求对象
     *
     * @param request 请求对象
     */
    public static void logHeader(HttpServletRequest request) {
        logHeader(request, null);
    }

    /**
     * 打印请求头-请求对象+描述
     *
     * @param request
     */
    public static void logHeader(HttpServletRequest request, String description) {
        String url = request.getRequestURL().toString();
        String ip = request.getRemoteAddr();
        String method = request.getMethod();
        logHeader(url, ip, method, description);
    }

    /**
     * 打印请求数据-数据
     *
     * @param args 请求数据
     */
    public static void logArgs(String args) {
        if (log.isInfoEnabled()) {
            log.info("Request[args]:{}", args);
        }
    }

    /**
     * 打印请求数据-AOP切点
     *
     * @param joinPoint 切点
     */
    public static void logArgs(JoinPoint joinPoint) {
        Object[] list = joinPoint.getArgs();
        List<String> argsList = new ArrayList<>();
        for (Object object : list) {
            if (object.getClass()
                    .toString()
                    .equalsIgnoreCase("class org.springframework.validation.BeanPropertyBindingResult")) {
                continue;
            }
            argsList.add(object.toString());
        }
        logArgs(argsList.toString());
    }

    /**
     * 打印请求数据-请求对象
     *
     * @param request    请求对象
     * @param ignoreList 忽略参数列表
     */
    public static void logArgs(HttpServletRequest request, List<String> ignoreList) {
        String method = request.getMethod();
        if (HttpMethodEnum.GET.getCode().equalsIgnoreCase(method.toLowerCase())
                || HttpMethodEnum.DELETE.getCode().equalsIgnoreCase(method.toLowerCase())) {
            Map<String, String[]> map = request.getParameterMap();
            Map<String, String> resultMap = new LinkedHashMap<>();
            for (Map.Entry<String, String[]> me : map.entrySet()) {
                String paramName = me.getKey();
                resultMap.put(paramName, request.getParameterValues(paramName).toString());
            }
            if (!resultMap.isEmpty()) {
                if (ignoreList != null && !ignoreList.isEmpty()) {
                    for (String ignore : ignoreList) {
                        resultMap.remove(ignore);
                    }
                }
                logArgs(resultMap.toString());
            }
        } else if (HttpMethodEnum.POST.getCode().equalsIgnoreCase(method.toLowerCase())
                || HttpMethodEnum.GET.getCode().equalsIgnoreCase(method.toLowerCase())) {
            try {
                RequestWrapper requestWrapper = new RequestWrapper(request);
                String body = requestWrapper.getBody();
                JSONObject jsonObject = JSON.parseObject(body);
                if (null != jsonObject) {
                    // 忽略不打印的参数
                    if ((null != ignoreList) && !ignoreList.isEmpty()) {
                        for (String ignore : ignoreList) {
                            jsonObject.remove(ignore);
                        }
                    }
                    logArgs(jsonObject.toString());
                }
            } catch (IOException e) {
                log.info("创建Request包装类失败", e);
            }
        }
    }

    /**
     * 打印请求-Controller的AOP
     *
     * @param joinPoint
     */
    public static void log(JoinPoint joinPoint) {
        if (!log.isInfoEnabled()) {
            return;
        }
        // ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        // HttpServletRequest request = attributes.getRequest();

        //打印请求头
        logHeader(joinPoint);
        //打印处理请求的类
//        logClass(joinPoint);
        //打印请求数据
//        logArgs(joinPoint);
        logClassArgs(joinPoint);
    }

    /**
     * 打印返回-返回格式化
     *
     * @param result
     */
    public static void logResult(String result) {
        logResult(0L, result);
    }

    /**
     * 打印返回-返回格式化+耗时
     *
     * @param time   耗时
     * @param result 返回数据
     */
    public static void logResult(Long time, String result) {
        if (log.isInfoEnabled()) {
            if (StringUtil.isNotBlank(result)) {
            	String tmp = result.replaceAll("\r\n", "").replaceAll("\n", "");
            	tmp = cutLogOfList(tmp);
                log.info("Response[{}]:{}", time, tmp);
            } else {
                log.info("Response[{}]:void", time);
            }
        }
    }

    /**
     * 打印返回-返回码+返回信息+返回数据
     *
     * @param time    耗时
     * @param code    返回码
     * @param message 返回消息
     * @param data    返回数据
     */
    public static void logResult(Long time, Integer code, String message, String data) {
        Map<String, Object> map = new TreeMap<>();
        map.put("code", code);
        map.put("message", message);
        map.put("data", data);
        logResult(time, map.toString());
    }

    /**
     * 打印返回-返回码+返回信息
     *
     * @param time    耗时
     * @param code    返回码
     * @param message 返回消息
     */
    public static void logResult(Long time, Integer code, String message) {
        logResult(time, code, message, null);
    }

    /**
     * 打印响应-Controller的AOP,增加joinPoint参数，用来判断是否打印返回类中的数据,默认是打印
     *
     * @param ret       返回类
     * @param startTime
     * @param joinPoint
     * @author: 高峰 2019/04/19
     */
    public static void log(Object ret, ThreadLocal<Long> startTime, JoinPoint joinPoint) {
        boolean isPrint = getSysLogIsData(joinPoint);
        if (!isPrint) {
            JSONObject jsonObject = new JSONObject();
            MorningResult resp = (MorningResult) ret;
            jsonObject.put("code", resp.getCode());
            jsonObject.put("message", resp.getMessage());
            log(jsonObject, startTime);
        } else {
            log(ret, startTime);
        }
    }

    public static void log(Object ret, ThreadLocal<Long> startTime) {
        logResult(System.currentTimeMillis() - startTime.get(), null == ret ? null : ret.toString());
    }

    /**
     * 打印请求-网关,默认打印全部参数
     *
     * @param ctx
     * @version v1.0.1, 2018/09/20  05:13:32 下午
     * @author 高峰
     */
    public static void logRequest(RequestContext ctx) {
        logRequest(ctx, null);
    }

    /**
     * 打印请求-网关，带忽略打印参数
     *
     * @param ctx        请求上下文
     * @param ignoreList 忽略打印的参数名称列表
     */
    public static void logRequest(RequestContext ctx, List<String> ignoreList) {
        if (!log.isInfoEnabled()) {
            return;
        }
        HttpServletRequest request = ctx.getRequest();
        // 打印请求头
        logHeader(request);
        // 打印数据
        logArgs(request, ignoreList);
    }

    /**
     * 打印应答-网关,不打印body
     *
     * @param ctx 请求上下文
     */
    public static void logResponse(RequestContext ctx) {
        logResponse(ctx, false);
    }

    /**
     * 打印应答-网关
     *
     * @param ctx         请求上下文
     * @param isPrintBody 是否打印数据体
     */
    public static void logResponse(RequestContext ctx, boolean isPrintBody) {
        if (!log.isInfoEnabled()) {
            return;
        }
        long startTime = getDuration(ctx);
        long endTime = System.currentTimeMillis();
        // 获取接口返回结果
        String body = getBody(ctx);
        JSONObject jsonObject = JSON.parseObject(body);
        if (null != jsonObject) {
            Integer code = jsonObject.getInteger("code");
            String message = jsonObject.getString("message");
            String data = jsonObject.getString("data");
            if (isPrintBody) {
                logResult(endTime - startTime, code, message, data);
            } else {
                logResult(endTime - startTime, code, message);
            }
        }

    }

    /**
     * 获取网关请求的数据
     *
     * @param ctx 网关请求上下文
     * @return
     */
    public static String getBody(RequestContext ctx) {
        String body = ctx.getResponseBody();
        if (StringUtil.isBlank(body)) {
            InputStream stream = ctx.getResponseDataStream();
            try {
                body = StreamUtils.copyToString(stream, Charset.forName(ShopConstant.UTF_8_ENCODING));
            } catch (IOException e) {
                return null;
            }
        }
        String result = new String(body);
        ctx.setResponseBody(result);
        return body;
    }

    /**
     * 获取请求的时间，自定义设置的属性
     *
     * @param ctx 网关请求上下文
     * @return 毫秒
     */
    static long getDuration(RequestContext ctx) {
        long time = 0;
        try {
            time = Long.parseLong(RequestContext.getCurrentContext().getRequest().getAttribute("duration").toString());
        } catch (Exception e) {
            time = System.currentTimeMillis();
        }
        return time;
    }

    /**
     * 获取注解的描述
     *
     * @param joinPoint 切点
     * @return 2018/09/12  02:00:20 下午
     * @author 高峰
     */
    public static String getSysLogDescription(JoinPoint joinPoint) {
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
        String description = "";
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    Annotation annotation = method.getAnnotation(SysLog.class);
                    if (annotation != null) {
                        description = method.getAnnotation(SysLog.class).value();
                    }
                    break;
                }
            }
        }
        return description;
    }

    /**
     * 获取注解的忽略打印列表
     *
     * @param joinPoint
     * @return
     */
    public static String[] getSysLogIgnores(JoinPoint joinPoint) {
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
                    Annotation annotation = method.getAnnotation(SysLog.class);
                    if (annotation != null) {
                        String[] ignores = method.getAnnotation(SysLog.class).ignores();
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
    public static String[] getSysLogHides(JoinPoint joinPoint) {
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
                    Annotation annotation = method.getAnnotation(SysLog.class);
                    if (annotation != null) {
                        String[] hides = method.getAnnotation(SysLog.class).hides();
                        return hides;
                    }
                }
            }
        }
        return null;
    }

    /**
     * 是否在返回类中打印返回数据，RespMsgDTO中的data属性
     *
     * @param joinPoint
     * @return
     */
    public static boolean getSysLogIsData(JoinPoint joinPoint) {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class targetClass = null;
        try {
            targetClass = Class.forName(targetName);
        } catch (ClassNotFoundException e) {
            return true;
        }
        Method[] methods = targetClass.getMethods();
        ;
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    Annotation annotation = method.getAnnotation(SysLog.class);
                    if (annotation != null) {
                        return method.getAnnotation(SysLog.class).isPrint();
                    }
                }
            }
        }
        return true;
    }
    
    /**
     * 处理日志中的列表-替换为空的列表，可以处理多个出现的列表，但是不能处理嵌套
     * @param str
     * @return
     */
    public static String cutLogOfList(String str) {
		if(StringUtil.isBlank(str)) {
			return null;
		}
		String tmp = str;
		Map<String,String> map = searchSame(str,"[{","}]");
		for(Map.Entry<String, String> entry: map.entrySet()) {
			tmp = cutString(tmp,Integer.parseInt(entry.getKey()),Integer.parseInt(entry.getValue()));
		}
		
		return tmp;
	}
	
    /**
     * 替换指定的字符串
     * @return
     */
	public static String cutString(String str,int start,int end) {
		StringBuilder sb = new StringBuilder();
		sb.append(str.substring(0, start));
		sb.append("[]");
		if(end+2 < str.length()) {
			sb.append(str.substring(end+2,str.length()));
		}
		return sb.toString();
	}
	
	/**
     * 过滤成对的字符数量（不能处理嵌套的对值）
     *
     * @param str 目标字符串
     * @param start 开始字符串
     * @param end 结束字符串
     * @return 返回成对只的索引
     */
	public static Map<String,String> searchSame(String str,String start,String end) {
        int indexStart = 0;//指定字符的长度
        int indexEnd = 0;
        indexStart = str.indexOf(start);
        indexEnd = str.indexOf(end);
        Map<String,String> ret = new TreeMap<String, String>(new Comparator<String>() {
                    public int compare(String obj1, String obj2) {
                    	//降序排序
                    	return Integer.parseInt(obj2) -Integer.parseInt(obj1);
                    }
                });
        while(indexStart!=-1) {
            ret.put(Integer.toString(indexStart), Integer.toString(indexEnd));
            indexStart = str.indexOf(start,indexStart+1);
            indexEnd = str.indexOf(end,indexEnd+1);
        }
        return ret;
    }
}

