package com.morning.common.util.sign;

import org.apache.log4j.Logger;

import java.util.Iterator;
import java.util.TreeMap;

/**
 * Created by feng.gaoo on 2017/3/23.
 */

/**
 * 签名工具类
 *
 * @author Warmsheep
 */
public class SignUtil {
    private static Logger logger = Logger.getLogger(SignUtil.class);
    /**
     * ======================================= 公共签名方法
     */

    /**
     * 比较签名是否正确
     *
     * @param origSign
     * @return
     */
    public static boolean signVerifyByObject(String channelKey, String origSign, Object... signObjs) {
        if (origSign == null) {
            return false;
        }
        String newSign = signByObject(channelKey, signObjs);
        if (origSign.equalsIgnoreCase(newSign)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 生成签名
     *
     * @param signObjs 签名所需元素
     * @return
     */
    public static String signByObject(String channelKey, Object... signObjs) {
        //计算签名所需要的内容
        StringBuilder signContent = new StringBuilder();
        signContent.append(channelKey);
        //有参数的情况下，签名内容需要拼接参数
        if (signObjs != null && signObjs.length > 0) {
            for (Object signElement : signObjs) {
                if (signElement != null) {
                    signContent.append(signElement);
                }
            }
        }
        logger.debug(signContent.toString());
        //生成签名
        String sign = EncryptUtil.md5Encrypt(signContent.toString());
        return sign;
    }


    /**
     * 签名
     *
     * @param map
     * @return
     */
    public static String signByMap(String channelKey, TreeMap<String, Object> map) {
        try {
            StringBuilder sb = new StringBuilder();
            Iterator<String> iterator = map.keySet().iterator();
            sb.append(channelKey);
            while (iterator.hasNext()) {
                Object key = iterator.next();
                Object valueObj = map.get(key);
                if (valueObj != null) {
                    //并将获取的值进行拼接
                    String value = valueObj.toString();
                    //LOGGER.debug("map:" + key + ":" + value);
                    //String valueutf=new String(value.getBytes(),"utf-8");
                    sb.append(value);
                }
            }
            logger.debug("SignData orig Data : " + sb.toString());
            String signData = EncryptUtil.md5Encrypt(sb.toString());
            logger.debug("SignData : " + signData);
            return signData;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 验证签名
     *
     * @param map
     * @param sign
     * @return
     */
    public static boolean signVerifyByMap(String channelKey, TreeMap<String, Object> map, String sign) {
        logger.debug("verify sign start ! sign :" + sign);
        try {
            StringBuilder sb = new StringBuilder();
            sb.append(channelKey);
            Iterator<String> iterator = map.keySet().iterator();
            while (iterator.hasNext()) {
                Object key = iterator.next();
                //并将获取的值进行拼接
                Object valueObj = map.get(key);
                if (valueObj != null && !"sign".equals(key.toString()) && !"images".equals(key.toString())) {
                    String value = valueObj.toString();
                    logger.debug("map:" + key + ":" + value);
                    sb.append(value);
                }
            }
            String md5Result = EncryptUtil.md5Encrypt(sb.toString());
            if (sign.equalsIgnoreCase(md5Result)) {
                logger.debug("verify success");
                return true;
            } else {
                logger.debug("verify failure");
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
