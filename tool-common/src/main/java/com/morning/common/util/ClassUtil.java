package com.morning.common.util;

import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.*;

/**
 * @author: gaof
 * @create: 2018/4/24 21:44
 * @Description: 类操作工具
 */
@Slf4j
public class ClassUtil {
    /**
     * 将对象属性转换位TreeMap结构
     *
     * @param model
     * @return
     * @throws Exception
     */
    public static TreeMap<String, Object> parseTreeMap(Object model) throws Exception {
        TreeMap<String, Object> param = new TreeMap<String, Object>();
        // 获取实体类的所有属性，返回Field数组
        Field[] field = model.getClass().getDeclaredFields();
        // 遍历所有属性
        for (int j = 0; j < field.length; j++) {
            // 获取属性的名字
            String name = field[j].getName();
//            // 将属性的首字符大写，方便构造get，set方法
            name = name.substring(0, 1).toUpperCase() + name.substring(1);
            // 获取属性的类型
            String type = field[j].getGenericType().toString();
            // 如果type是类类型，则前面包含"class "，后面跟类名
            if ("class java.lang.String".equals(type)) {
                Method m = model.getClass().getMethod("get" + name);
                // 调用getter方法获取属性值
                String value = (String) m.invoke(model);
                if (!StringUtils.isEmpty(value)) {
                    param.put(name, value);
                } else {
                    log.debug("属性:{},类型:Stirng,值为:空", name);
                }
            }
            if ("class java.lang.Integer".equals(type)) {
                Method m = model.getClass().getMethod("get" + name);
                Integer value = (Integer) m.invoke(model);
                if (value != null) {
                    param.put(name, value);
                } else {
                    log.debug("属性:{},类型:Integer,值为:空", name);
                }
            }
            if ("class java.lang.Short".equals(type)) {
                Method m = model.getClass().getMethod("get" + name);
                Short value = (Short) m.invoke(model);
                if (value != null) {
                    param.put(name, value);
                } else {
                    log.debug("属性:{},类型:Short,值为:空", name);
                }
            }
            if ("class java.lang.Double".equals(type)) {
                Method m = model.getClass().getMethod("get" + name);
                Double value = (Double) m.invoke(model);
                if (value != null) {
                    param.put(name, value);
                } else {
                    log.debug("属性:{},类型:Double,值为:空", name);
                }
            }
            if ("class java.lang.Boolean".equals(type)) {
                Method m = model.getClass().getMethod("get" + name);
                Boolean value = (Boolean) m.invoke(model);
                if (value != null) {
                    param.put(name, value);
                } else {
                    log.debug("属性:{},类型:Boolean,值为:空", name);
                }
            }
            if ("class java.com.morning.common.util.Date".equals(type)) {
                Method m = model.getClass().getMethod("get" + name);
                Date value = (Date) m.invoke(model);
                if (value != null) {
                    param.put(name, value);
                } else {
                    log.debug("属性:{},类型:Date,值为:空", name);
                }
            }
        }
        return param;
    }

    /**
     * 根据属性名获取属性值
     *
     * @param fieldName 属性名
     * @param object    对象
     * @return
     */
    public static Object getFieldValueByName(String fieldName, Object object) {
        try {
            String firstLetter = fieldName.substring(0, 1).toUpperCase();
            String getter = "get" + firstLetter + fieldName.substring(1);
            Method method = object.getClass().getMethod(getter, new Class[]{});
            Object value = method.invoke(object, new Object[]{});
            return value;
        } catch (Exception e) {
            log.debug(e.getMessage(), e);
            return object;
        }
    }

    /**
     * 根据属性名设置属性值
     *
     * @param fieldName 属性名
     * @param object    对象
     * @param value     属性值
     * @return
     */
    public static void setFieldValueByName(String fieldName, Object object, String value) {
        try {
            // 获取obj类的字节文件对象
            Class c = object.getClass();
            // 获取该类的成员变量
            Field f = c.getDeclaredField(fieldName);
            // 取消语言访问检查
            f.setAccessible(true);
            // 给变量赋值
            f.set(object, value);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
    }

    /**
     * 获取本对象以及父类所有属性
     *
     * @param object 对象
     * @return
     */
    public static Field[] getDeclaredField(Object object) {
        Class clazz = object.getClass();
        List<Field> fieldList = new ArrayList<>();
        while (clazz != null){
            fieldList.addAll(new ArrayList<>(Arrays.asList(clazz.getDeclaredFields())));
            clazz = clazz.getSuperclass();
        }
        Field[] fields = new Field[fieldList.size()];
        fieldList.toArray(fields);
        return fields;
    }
}