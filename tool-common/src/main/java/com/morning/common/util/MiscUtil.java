/**
 * Copyright 2018-2020 stylefeng & fengshuonan (sn93@qq.com)
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.morning.common.util;


import com.morning.common.base.exception.BusinessException;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.math.BigDecimal;
import java.net.*;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 高频方法集合
 *
 * @author fengshuonan
 * @Date 2018/3/18 21:55
 */
public class MiscUtil {

    /**
     * 默认密码盐长度
     */
    public static final int SALT_LENGTH = 6;
    public static final String SPECIAL_CHAR = "!@#$%^&*()_+";
    // 时间戳
    private static final long TWEPOCH = 1288834974657L;
    // 工作者左位移量
    private static final long WORKER_ID_BITS = 5L;
    // 数据中心左位移量
    private static final long DATACENTER_ID_BITS = 5L;
    // 自增序列位数
    private static final long SEQUENCE_BITS = 12L;
    // ID生产者左位移量
    private static final long WORKER_ID_SHIFT = SEQUENCE_BITS;
    // 数据中心左位移量
    private static final long DATACENTER_ID_SHIFT = SEQUENCE_BITS + WORKER_ID_BITS;
    // 时间戳左位移量
    private static final long TIMESTAMP_LEFT_SHIFT = SEQUENCE_BITS + WORKER_ID_BITS + DATACENTER_ID_BITS;
    // 自增序列最大生成数
    private static final long SEQUENCE_MASK  = -1L ^ (-1L << SEQUENCE_BITS);
    private static long       WORKER_ID      = 1;
    private static long       DATACENTER_ID  = 2;
    private static long       SEQUENCE       = 0L;
    private static long       LAST_TIMESTAMP = -1L;
    public static final String ALL_CHAR_STR =
            "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()_+";
    /**
     * 对象是否不为空(新增)
     *
     * @author fengshuonan
     * @Date 2018/3/18 21:57
     */
    public static boolean isNotEmpty(Object o) {
        return !isEmpty(o);
    }

    /**
     * 对象是否为空
     *
     * @author fengshuonan
     * @Date 2018/3/18 21:57
     */
    public static boolean isEmpty(Object o) {
        if (o == null) {
            return true;
        }
        if (o instanceof String) {
            if (o.toString().trim().equals("")) {
                return true;
            }
        } else if (o instanceof List) {
            if (((List) o).size() == 0) {
                return true;
            }
        } else if (o instanceof Map) {
            if (((Map) o).size() == 0) {
                return true;
            }
        } else if (o instanceof Set) {
            if (((Set) o).size() == 0) {
                return true;
            }
        } else if (o instanceof Object[]) {
            if (((Object[]) o).length == 0) {
                return true;
            }
        } else if (o instanceof int[]) {
            if (((int[]) o).length == 0) {
                return true;
            }
        } else if (o instanceof long[]) {
            if (((long[]) o).length == 0) {
                return true;
            }
        }
        return false;
    }

    /**
     * 对象组中是否存在空对象
     *
     * @author fengshuonan
     * @Date 2018/3/18 21:59
     */
    public static boolean isOneEmpty(Object... os) {
        for (Object o : os) {
            if (isEmpty(o)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 获取随机字符,自定义长度
     *
     * @author fengshuonan
     * @Date 2018/3/18 21:55
     */
    public static String getRandomString(int length) {
        String base = "abcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }

    /**
     * md5加密(加盐)
     *
     * @author fengshuonan
     * @Date 2018/3/18 21:56
     */
    public static String md5Hex(String password, String salt) {
        return md5Hex(password + salt);
    }

    /**
     * md5加密(不加盐)
     *
     * @author fengshuonan
     * @Date 2018/3/18 21:56
     */
    public static String md5Hex(String str) {
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            byte[] bs = md5.digest(str.getBytes());
            StringBuffer md5StrBuff = new StringBuffer();
            for (int i = 0; i < bs.length; i++) {
                if (Integer.toHexString(0xFF & bs[i]).length() == 1)
                    md5StrBuff.append("0").append(Integer.toHexString(0xFF & bs[i]));
                else
                    md5StrBuff.append(Integer.toHexString(0xFF & bs[i]));
            }
            return md5StrBuff.toString();
        } catch (Exception e) {
            throw new BusinessException("md5加密异常");
        }
    }

    /**
     * 过滤掉掉字符串中的空白
     *
     * @author fengshuonan
     * @Date 2018/3/22 15:16
     */
    public static String removeWhiteSpace(String value) {
        if (StringUtil.isEmpty(value)) {
            return "";
        } else {
            return value.replaceAll("\\s*", "");
        }
    }

    /**
     * 获取异常的具体信息
     *
     * @author fengshuonan
     * @Date 2017/3/30 9:21
     * @version 2.0
     */
    public static String getExceptionMsg(Throwable e) {
        StringWriter sw = new StringWriter();
        try {
            e.printStackTrace(new PrintWriter(sw));
        } finally {
            try {
                sw.close();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
        return sw.getBuffer().toString().replaceAll("\\$", "T");
    }

    /**
     * 获取临时目录
     *
     * @author stylefeng
     * @Date 2017/5/24 22:35
     */
    public static String getTempPath() {
        return System.getProperty("java.io.tmpdir");
    }

    /**
     * 获取文件后缀名 不包含点
     *
     * @author fengshuonan
     * @Date 2017/11/15 下午11:10
     */
    public static String getFileSuffix(String fileWholeName) {
        if (StringUtil.isEmpty(fileWholeName)) {
            return "none";
        }
        int lastIndexOf = fileWholeName.lastIndexOf(".");
        return fileWholeName.substring(lastIndexOf + 1);
    }

    /**
     * 将字符串"分"转换成"元"（长格式），如：100分被转换为1.00元。
     * @param s
     * @return
     */
    public static String convertCent2Dollar(String s) {
        if("".equals(s) || s ==null){
            return "";
        }
        long l;
        if(s.length() != 0) {
            if(s.charAt(0) == '+') {
                s = s.substring(1);
            }
            l = Long.parseLong(s);
        } else {
            return "";
        }
        boolean negative = false;
        if(l < 0) {
            negative = true;
            l = Math.abs(l);
        }
        s = Long.toString(l);
        if(s.length() == 1) {
            return (negative ? ("-0.0" + s) : ("0.0" + s));
        }
        if(s.length() == 2) {
            return (negative ? ("-0." + s) : ("0." + s));
        } else {
            return (negative ? ("-" + s.substring(0, s.length() - 2) + "." + s
                    .substring(s.length() - 2)) : (s.substring(0,
                    s.length() - 2)
                    + "." + s.substring(s.length() - 2)));
        }
    }
    /**
     * 生出唯一的uuid(大写)，可用于数据库pk主键，线程同步
     * 使用twitter snowflake算法
     * snowflake生产的ID是一个18位的long型数字，二进制结构表示如下(每部分用-分开):
     * 0 - 00000000 00000000 00000000 00000000 00000000 0 - 00000 - 00000 - 00000000 0000
     * 第一位未使用，接下来的41位为毫秒级时间(41位的长度可以使用69年，从1970-01-01 08:00:00)，
     * 然后是5位datacenterId(最大支持2^5＝32个，二进制表示从00000-11111，也即是十进制0-31)
     * 和5位workerId(最大支持2^5＝32个，原理同datacenterId),
     * 所以datacenterId*workerId最多支持部署1024个节点,
     * 最后12位是毫秒内的计数(12位的计数顺序号支持每个节点每毫秒产生2^12＝4096个ID序号)
     * 禅道项目-收单微服务-任务[355]
     *
     * @return
     */
    public static synchronized String getUuid() {
        // 获取当前服务器时钟
        long timestamp = System.currentTimeMillis();
        if (timestamp < LAST_TIMESTAMP) {
            // 服务器时钟被调整了,ID生成器停止服务
            System.out.println("Clock moved backwards,Refusing to service,Current time millis:{}"+timestamp);
            throw new RuntimeException(
                    String.format("Clock moved backwards,Refusing to generate id for %d milliseconds",
                            LAST_TIMESTAMP - timestamp));
        }
        if (LAST_TIMESTAMP == timestamp) {
            SEQUENCE = (SEQUENCE + 1) & SEQUENCE_MASK;
            if (SEQUENCE == 0) {
                timestamp = getCurrentTimeMillis(LAST_TIMESTAMP);
            }
        } else {
            SEQUENCE = 0L;
        }
        LAST_TIMESTAMP = timestamp;
        long uuid = ((timestamp - TWEPOCH) << TIMESTAMP_LEFT_SHIFT) | (DATACENTER_ID << DATACENTER_ID_SHIFT)
                | (WORKER_ID << WORKER_ID_SHIFT) | SEQUENCE;
        return String.valueOf(uuid).toUpperCase();
    }

    /**
     * 获取当前服务器时钟
     * @param LAST_TIMESTAMP
     * @return
     */
    protected static long getCurrentTimeMillis(long LAST_TIMESTAMP) {
        long timestamp = System.currentTimeMillis();
        while (timestamp <= LAST_TIMESTAMP) {
            timestamp = System.currentTimeMillis();
        }
        return timestamp;
    }

}
