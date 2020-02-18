package com.morning.common.util;

import org.apache.commons.lang.ObjectUtils;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.util.*;

/**
 * Created by lst on 2019/8/23.
 * 描述:
 */
public class MapUtil {
    /**
     * 转换bean为map
     *
     * @param source 要转换的bean
     * @param <T>    bean类型
     * @return 转换结果
     */
    public static <T> Map<String, Object> bean2Map(Object bean) {
        try {
            Map<String, Object> map = new HashMap<>();
            BeanInfo info = Introspector.getBeanInfo(bean.getClass(), Object.class);
            PropertyDescriptor[] pds = info.getPropertyDescriptors();
            for (PropertyDescriptor pd : pds) {
                String key = pd.getName();
                Object value = pd.getReadMethod().invoke(bean);
                map.put(key, value);
            }
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static <T> T map2Bean(Map<String, Object> map, Class<T> beanType) {
        // 去除空值
        //removeNullValue(map);
        try {
            T t = beanType.newInstance();
            // 获取实体类的所有属性，返回Field数组
            Field[] fields = beanType.getDeclaredFields();
            for (Field field : fields) {
                for (Map.Entry entry : map.entrySet()) {
                    if (entry.getKey().equals(field.getName())) {
                        if (null ==entry.getValue()){
                            continue;
                        }
                        setObjectValue(t, field, entry.getValue());
                    }
                }
            }
            return t;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 这里需要说明一下：他是根据拼凑的字符来找你写的getter方法的
     * 在Boolean值的时候是isXXX（默认使用ide生成getter的都是isXXX）
     * 如果出现NoSuchMethod异常 就说明它找不到那个gettet方法 需要做个规范
     */
    public static void setObjectValue(Object object, Field field, Object value) throws Exception {
        //System.out.println(field.getGenericType());//打印该类的所有属性类型
        field.setAccessible(true);
        switch (field.getGenericType().toString()) {
            case "class java.lang.String":
                // 如果类型是String
                field.set(object, (String) value);
                break;
            case "class java.lang.Integer":
                // 如果类型是Integer
                field.set(object, Integer.valueOf(ObjectUtils.toString(value)));
                break;
            case "class java.lang.Double":
                // 如果类型是Double
                field.set(object, Double.valueOf(ObjectUtils.toString(value)));
                break;
            case "class java.lang.Boolean":
                // 如果类型是Boolean 是封装类
                field.set(object, (Boolean) value);
                break;
            case "boolean":
                // 如果类型是boolean
                field.set(object, (Boolean) value);
                break;
            case "class java.lang.Short":
                // 如果类型是Short
                field.set(object, Short.valueOf(ObjectUtils.toString(value)));
                break;
            default:
                // 如果还需要其他的类型请自己做扩展
                System.out.println("如果还需要其他的类型请自己做扩展");
                break;
        }
    }

    /**
     * 移除map中空key或者value空值
     *
     * @param map
     */
    public static void removeNullEntry(Map map) {
        removeNullKey(map);
        removeNullValue(map);
    }

    /**
     * 移除map的空key
     *
     * @param map
     * @return
     */
    public static void removeNullKey(Map map) {
        Set set = map.keySet();
        for (Iterator iterator = set.iterator(); iterator.hasNext(); ) {
            Object obj = (Object) iterator.next();
            remove(obj, iterator);
        }
    }

    /**
     * 移除map中的value空值
     *
     * @param map
     * @return
     */
    public static void removeNullValue(Map map) {
        Set set = map.keySet();
        for (Iterator iterator = set.iterator(); iterator.hasNext(); ) {
            Object obj = (Object) iterator.next();
            Object value = (Object) map.get(obj);
            remove(value, iterator);
        }
    }

    /**
     * 移除map中的空值
     * <p>
     * Iterator 是工作在一个独立的线程中，并且拥有一个 mutex 锁。
     * Iterator 被创建之后会建立一个指向原来对象的单链索引表，当原来的对象数量发生变化时，这个索引表的内容不会同步改变，
     * 所以当索引指针往后移动的时候就找不到要迭代的对象，所以按照 fail-fast 原则 Iterator 会马上抛出 java.util.ConcurrentModificationException 异常。
     * 所以 Iterator 在工作的时候是不允许被迭代的对象被改变的。
     * 但你可以使用 Iterator 本身的方法 remove() 来删除对象， Iterator.remove() 方法会在删除当前迭代对象的同时维护索引的一致性。
     *
     * @param obj
     * @param iterator
     */
    private static void remove(Object obj, Iterator iterator) {
        if (obj instanceof String) {
            String str = (String) obj;
            if (isEmpty(str)) { //过滤掉为null和""的值 主函数输出结果map：{2=BB, 1=AA, 5=CC, 8= }
                iterator.remove();
            }
        } else if (obj instanceof Collection) {
            Collection col = (Collection) obj;
            if (col == null || col.isEmpty()) {
                iterator.remove();
            }
        } else if (obj instanceof Map) {
            Map temp = (Map) obj;
            if (temp == null || temp.isEmpty()) {
                iterator.remove();
            }
        } else if (obj instanceof Object[]) {
            Object[] array = (Object[]) obj;
            if (array == null || array.length <= 0) {
                iterator.remove();
            }
        } else {
            if (obj == null) {
                iterator.remove();
            }
        }
    }

    public static boolean isEmpty(Object obj) {
        return obj == null || obj.toString().length() == 0;
    }

    public static void main(String[] args) {
        Map map = new HashMap();
        map.put(1, "AA");
        map.put("2", "BB");
        map.put("5", "CC");
        map.put("6", null);
        map.put("7", "");
        map.put("8", " ");
        System.out.println(map);//输出结果：{2=BB, 1=AA, 7=, 6=null, 5=CC, 8= }
        removeNullEntry(map);
        System.out.println(map);
    }

}
