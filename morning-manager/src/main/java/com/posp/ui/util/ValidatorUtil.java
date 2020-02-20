package com.posp.ui.util;

import com.posp.message.common.exception.PospBusinessException;
import org.apache.commons.lang3.StringUtils;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import java.lang.reflect.Field;
import java.util.Set;

/**
 * hibernate-validator校验工具类
 *
 * 参考文档：http://docs.jboss.org/hibernate/validator/5.4/reference/en-US/html_single/
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017-03-15 10:50
 */
public class ValidatorUtil {
    private static Validator validator;

    static {
        validator = Validation.buildDefaultValidatorFactory().getValidator();
    }

    /**
     * 校验对象
     * @param object        待校验对象
     * @throws RRException  校验不通过，则报RRException异常
     */
    public static void validateEntity(Object object)
            throws PospBusinessException {
        Set<ConstraintViolation<Object>> constraintViolations = validator.validate(object);
        if (!constraintViolations.isEmpty()) {
            ConstraintViolation<Object> constraint = (ConstraintViolation<Object>)constraintViolations.iterator().next();
            throw new PospBusinessException(constraint.getMessage());
        }
    }

    /**
     * 校验对象属性
     * @param object        待校验对象
     * @throws RRException  校验不通过，则报RRException异常
     */
    public static String validateProperty(Object object,String propertyName) {
        Set<ConstraintViolation<Object>> constraintViolations = validator.validateProperty(object,propertyName);
        if (!constraintViolations.isEmpty()) {
            ConstraintViolation<Object> constraint = (ConstraintViolation<Object>)constraintViolations.iterator().next();
            return constraint.getMessage();
        }else {
            return null;
        }
    }
    /**
     * 判断对象中属性值是否全为空
     *
     * @param object
     * @return
     */
    public static boolean checkObjAllFieldsIsNull(Object object) {
        if (null == object) {
            return true;
        }
        try {
            for (Field f : object.getClass().getDeclaredFields()) {
                f.setAccessible(true);
                if (f.get(object) != null && StringUtils.isNotBlank(f.get(object).toString())) {
                    return false;
                }
            }
        } catch (Exception e) {
            // e.printStackTrace();
        }

        return true;
    }

}
