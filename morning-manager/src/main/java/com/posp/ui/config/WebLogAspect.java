//~ Formatted by Jindent --- http://www.jindent.com
package com.posp.ui.config;

import java.lang.reflect.Field;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.posp.ui.service.ILogService;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.posp.common.service.user.ao.LogAO;
import com.posp.common.service.user.bo.LogBO;
import com.posp.tool.common.data.ClassUtil;
import com.posp.tool.common.data.UuidUtil;
import com.posp.tool.common.log.LogUtil;
import com.posp.ui.entity.ResultDTO;
import com.posp.ui.entity.UserVO;
import com.posp.ui.util.ShiroUtil;

import lombok.extern.slf4j.Slf4j;

/**
 * @author: gaof
 * @create: 2018/5/22 17:10
 * @Description: controller请求时打印的日志, 退出时打印结果，同时存储操作记录
 */
@Aspect
@Component
@Slf4j
public class WebLogAspect {
    @Autowired
    private ILogService logService;

    /**
     * 返回后更新操作结果
     *
     * @param joinPoint
     * @param ret
     * @throws Throwable
     * @version        v1.0.1, 2018/09/14 12:11:15 上午
     * @author         gaofeng
     */
    @AfterReturning(
        returning = "ret",
        pointcut  = "logPoint()"
    )
    public void doAfterReturning(JoinPoint joinPoint, Object ret) throws Throwable {
        if (ret.getClass() == ResultDTO.class) {
            ServletRequestAttributes attributes =
                (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            HttpServletRequest request = attributes.getRequest();
            ResultDTO          result  = (ResultDTO) ret;
            LogBO              logBO   = new LogBO();

            logBO.setCode(result.getCode().toString());
            logBO.setMessage(result.getMsg());
            logBO.setId(request.getAttribute("recordId").toString());

			logService.update(logBO);
        }
    }

    /**
     * 请求存储请求数据
     *
     * @param joinPoint
     * @throws Throwable
     * @version        v1.0.1, 2018/09/14 12:11:15 上午
     * @author         gaofeng
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
	@Before("logPoint()")
	public void doBefore(JoinPoint joinPoint) throws Throwable {
		ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = attributes.getRequest();
		LogAO logAO = new LogAO();
		String uuid = UuidUtil.getUuid();

		String[] ignores = WebLogUtil.getWebLogIgnores(joinPoint);
		String[] hides = WebLogUtil.getWebLogHides(joinPoint);
		String[] removes = WebLogUtil.getWebLogRemoves(joinPoint);

		request.setAttribute("recordId", uuid);
		logAO.setId(uuid);

		Object[] list = joinPoint.getArgs();
		JSONObject jsonObject = new JSONObject();
		for (int k = 0; k < list.length; k++) {
			Object object = list[k];
			if (object.getClass().toString()
					.equalsIgnoreCase("class org.springframework.validation.BeanPropertyBindingResult")) {
				continue;
				// 基本类型及包装类的处理，不全，后继在补充
			} else if (object instanceof String) {
				String[] argNames = ((MethodSignature) joinPoint.getSignature()).getParameterNames();
				jsonObject.put(argNames[k], object.toString());
				WebLogUtil.setHideParam(jsonObject, argNames[k], object.toString(), hides);
				WebLogUtil.setIgnoreParam(jsonObject, argNames[k], object.toString(), ignores);
				WebLogUtil.setRemoveParam(jsonObject, argNames[k], object.toString(), removes);
			} else if (object instanceof Map) {
				Map<String, Object> map = (Map) object;
				for (Map.Entry<String, Object> entry : map.entrySet()) {
					// 空值的参数不打印
					if (null != entry.getValue()) {
						jsonObject.put(entry.getKey(), entry.getValue());
						WebLogUtil.setHideParam(jsonObject, entry.getKey(), entry.getValue().toString(), hides);
						WebLogUtil.setIgnoreParam(jsonObject, entry.getKey(), entry.getValue().toString(), ignores);
						WebLogUtil.setRemoveParam(jsonObject, entry.getKey(), entry.getValue().toString(), removes);
					}
				}
			} else {
				Field[] fields = ClassUtil.getDeclaredField(object);
				for (int i = 0; i < fields.length; i++) {
					Object value = ClassUtil.getFieldValueByName(fields[i].getName(), object);
					if (null != value) {
						jsonObject.put(fields[i].getName(), value.toString());
						WebLogUtil.setHideParam(jsonObject, fields[i].getName(), value.toString(), hides);
						WebLogUtil.setIgnoreParam(jsonObject, fields[i].getName(), value.toString(), ignores);
						WebLogUtil.setRemoveParam(jsonObject, fields[i].getName(), value.toString(), removes);
					}
				}
			}

		}
		logAO.setArgs(jsonObject.toJSONString());

		logAO.setClassMethod(
				joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());
		logAO.setHttpMethod(request.getMethod());
		logAO.setIp(request.getRemoteAddr());
		logAO.setUrl(request.getRequestURI());
		logAO.setRemark(LogUtil.getSysLogDescription(joinPoint));

		UserVO user = ShiroUtil.getUserEntity();

		if (null == user) {
			// 如果是登录操作，那么此时是没有user的，取登录方法第一个参数，即username作为登录名
			if (!ObjectUtils.isEmpty(list)) {
				logAO.setCreateUserId(list[0].toString());
			} else {
			}
		} else {
			logAO.setCreateUserId(user.getUsername());
			logAO.setOrgCode(user.getOrgCode());
		}

		logService.insert(logAO);
	}

    /**
     * Method description
     *
     * @version        v1.0.1, 2018/09/14 12:11:15 上午
     * @author         gaofeng
     */
    @Pointcut("@annotation(com.posp.ui.config.WebLog)")
    public void logPoint() {}
}
