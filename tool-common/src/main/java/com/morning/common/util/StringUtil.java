package com.morning.common.util;

import org.springframework.util.StringUtils;

import java.io.UnsupportedEncodingException;

/**
 * @Author Gaofeng
 * @Date 2017/3/29 15:35
 */
public class StringUtil {
    public static final String UNDERLINE = "_";
    public static final char UNDERLINE_CHAR = '_';

    public StringUtil() {
    }

    public static boolean isBlank(String str) {
        if (StringUtils.isEmpty(str)) {
            return true;
        } else {
            str = str.trim();
            return isEmpty(str);
        }
    }

    public static boolean isEmpty(String str) {
        return StringUtils.isEmpty(str);
    }

    public static boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }

    public static boolean isNotBlank(String str) {
        return !isBlank(str);
    }

    public static String deleteCharString(String sourceString, char chElemData) {
        String deleteString = "";

        for(int i = 0; i < sourceString.length(); ++i) {
            if (sourceString.charAt(i) != chElemData) {
                deleteString = deleteString + sourceString.charAt(i);
            }
        }

        return deleteString;
    }

    public static String toStringAndTrim(Object object) {
        return object == null ? "" : object.toString().trim();
    }

    /**
     * 将下划线方式命名的字符串转换为驼峰式。如果转换前的下划线大写方式命名的字符串为空，则返回空字符串。<br>
     * 例如：hello_world=》helloWorld
     *
     * @param name 转换前的下划线大写方式命名的字符串
     * @return 转换后的驼峰式命名的字符串
     */
    public static String toCamelCase(CharSequence name) {
        if (null == name) {
            return null;
        }

        String name2 = name.toString();
        if (name2.contains(UNDERLINE)) {
            final StringBuilder sb = new StringBuilder(name2.length());
            boolean upperCase = false;
            for (int i = 0; i < name2.length(); i++) {
                char c = name2.charAt(i);

                if (c == UNDERLINE_CHAR) {
                    upperCase = true;
                } else if (upperCase) {
                    sb.append(Character.toUpperCase(c));
                    upperCase = false;
                } else {
                    sb.append(Character.toLowerCase(c));
                }
            }
            return sb.toString();
        } else {
            return name2;
        }
    }
}


