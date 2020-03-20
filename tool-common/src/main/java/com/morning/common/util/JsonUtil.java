package com.morning.common.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.logging.Logger;

/**
 * @author yidasanqian
 */
public class JsonUtil {

    private static final Logger log = Logger.getLogger("JsonUtil");
    private static String classType;
    private static ObjectMapper objectMapper;

    static {
        objectMapper = new ObjectMapper();
        objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
    }

    /**
     * 解析json字符串到Map
     *
     * @param json 要解析的json字符串
     * @return 返回Map
     */
    public static Map toMap(String json) {
        return JSON.parseObject(json, LinkedHashMap.class);
    }

    /**
     * 解析json字符串到List
     *
     * @param json 要解析的json字符串
     * @return 返回List
     */
    public static List toList(String json) {
        return JSON.parseObject(json, LinkedList.class);
    }

    /**
     * 按指定的Type解析json字符串到List
     *
     * @param json 要解析的json字符串
     * @param type {@link Type}
     * @return 返回List
     */
    public static <T> List<T> toList(String json, final Type type) {
        TypeReference<T> typeReference1 = new TypeReference<T>() {
            @Override
            public Type getType() {
                return type;
            }
        };
        return JSON.parseObject(json, typeReference1.getType());
    }

    /**
     * 解析对象为Json字符串
     *
     * @param object 要转换的对象
     * @return 返回对象的json字符串
     */
    public static String toJsonStr(Object object) {
        return JSON.toJSONString(object);
    }

    /**
     * 解析对象为Json字符串
     *
     * @param object 要转换的对象
     * @param dateFormatPattern 日期格式，如"yyyy年MM月dd日 HH时mm分ss秒"
     * @return 返回对象的json字符串
     */
    public static String toJsonWithDateFormat(Object object, String dateFormatPattern) {
        return JSON.toJSONStringWithDateFormat(object, dateFormatPattern, SerializerFeature.WriteDateUseDateFormat);
    }

    /**
     * 解析json字符串到指定类型的对象
     *
     * @param json      要解析的json字符串
     * @param valueType 类对象class
     * @param <T>       泛型参数类型
     * @return 返回解析后的对象
     */
    public static <T> T toPojo(String json, Class<T> valueType) {
        return JSON.parseObject(json, valueType);
    }

    /**
     * 转换对象到Map
     *
     * @param fromValue 与Map可兼容的对象
     * @return 返回Map对象
     */
    public static Map convertToMap(Object fromValue) {
        String json = JSON.toJSONString(fromValue);
        return JSON.parseObject(json, LinkedHashMap.class);
    }

    /**
     * 从Map转换到对象
     *
     * @param fromMap     Map对象
     * @param toValueType 与Map可兼容的对象类型
     * @param <T>         泛型参数类型
     * @return 返回Map转换得到的对象
     */
    public static <T> T convertFromMap(Map fromMap, Class<T> toValueType) {
        String json = JSON.toJSONString(fromMap);
        return JSON.parseObject(json, toValueType);
    }
}
