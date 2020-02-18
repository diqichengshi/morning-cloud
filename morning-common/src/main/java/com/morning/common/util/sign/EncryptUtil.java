package com.morning.common.util.sign;

import org.apache.log4j.Logger;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;

/**
 * Created by feng.gaoo on 2017/3/23.
 */

/**
 * DES加密工具类
 *
 * @author Warmsheep
 */
public class EncryptUtil {
    private static Logger logger = Logger.getLogger(EncryptUtil.class);
    private static final String model = "DESede/ECB/PKCS5Padding";//填充模式(PKCS5Padding)   选择不自动应用任何填充(NoPadding)

    /**
     * DES解密
     *
     * @param message
     * @param key
     * @return
     * @throws Exception
     */
    public static String desDecrypt(String message, String key) throws Exception {
        try {
            byte[] keyBytes = null;
            if (key.length() == 16) {
                keyBytes = newInstance8Key(ByteUtil.convertHexString(key));
            } else if (key.length() == 32) {
                keyBytes = newInstance16Key(ByteUtil.convertHexString(key));
            } else if (key.length() == 48) {
                keyBytes = newInstance24Key(ByteUtil.convertHexString(key));
            }
            SecretKey deskey = new SecretKeySpec(keyBytes, "DESede");
            Cipher c1 = Cipher.getInstance(model);
            c1.init(2, deskey);
            byte[] retByte = c1.doFinal(ByteUtil.convertHexString(message));

            return new String(retByte);
        } catch (Exception e) {
            System.err.println(e);
        }
        return null;
    }

    /**
     * DES解密
     *
     * @param message
     * @param key
     * @return
     * @throws Exception
     */
    public static String desDecryptToHex(String message, String key) throws Exception {
        try {
            byte[] keyBytes = null;
            if (key.length() == 16) {
                keyBytes = newInstance8Key(ByteUtil.convertHexString(key));
            } else if (key.length() == 32) {
                keyBytes = newInstance16Key(ByteUtil.convertHexString(key));
            } else if (key.length() == 48) {
                keyBytes = newInstance24Key(ByteUtil.convertHexString(key));
            }
            SecretKey deskey = new SecretKeySpec(keyBytes, "DESede");
            Cipher c1 = Cipher.getInstance(model);
            c1.init(2, deskey);
            byte[] retByte = c1.doFinal(ByteUtil.convertHexString(message));

            return ByteUtil.toHexString(retByte);
        } catch (Exception e) {
            System.err.println(e);
        }
        return null;
    }


    /**
     * DES加密
     *
     * @param message
     * @param key
     * @return
     * @throws Exception
     */
    public static String desEncrypt(String message, String key) throws Exception {
        byte[] keyBytes = null;
        if (key.length() == 16) {
            keyBytes = newInstance8Key(ByteUtil.convertHexString(key));
        } else if (key.length() == 32) {
            keyBytes = newInstance16Key(ByteUtil.convertHexString(key));
        } else if (key.length() == 48) {
            keyBytes = newInstance24Key(ByteUtil.convertHexString(key));
        }
        SecretKey deskey = new SecretKeySpec(keyBytes, "DESede");
        Cipher cipher = Cipher.getInstance(model);
        cipher.init(1, deskey);
        return ByteUtil.toHexString(cipher.doFinal(message.getBytes("UTF-8")));
    }

    public static String desEncryptHexString(String message, String key) throws Exception {
        byte[] keyBytes = null;
        if (key.length() == 16) {
            keyBytes = newInstance8Key(ByteUtil.convertHexString(key));
        } else if (key.length() == 32) {
            keyBytes = newInstance16Key(ByteUtil.convertHexString(key));
        } else if (key.length() == 48) {
            keyBytes = newInstance24Key(ByteUtil.convertHexString(key));
        }

        SecretKey deskey = new SecretKeySpec(keyBytes, "DESede");

        Cipher cipher = Cipher.getInstance(model);
        cipher.init(1, deskey);
        return ByteUtil.toHexString(cipher.doFinal(ByteUtil.convertHexString(message)));
    }


    /***
     * MD5加码 生成32位md5码
     */
    public static String md5Encrypt(String message) {
        MessageDigest md5 = null;
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (Exception e) {
            System.out.println(e.toString());
            e.printStackTrace();
            return "";
        }
        byte[] md5Bytes = new byte[0];
        try {
            md5Bytes = md5.digest(message.getBytes("utf-8"));
        } catch (UnsupportedEncodingException e) {
            logger.error("签名数据编码格式转换出错",e);
            return "";
        }
        String hexValue = ByteUtil.toHexString(md5Bytes);
        return hexValue;

    }


    private static byte[] newInstance24Key(byte[] key) {
        if ((key != null) && (key.length == 24)) {
            return key;
        }
        System.err.println("密钥长度有误,期望值[24]");
        return null;
    }

    private static byte[] newInstance16Key(byte[] key) {
        if ((key != null) && (key.length == 16)) {
            byte[] b = new byte[24];
            System.arraycopy(key, 0, b, 0, 16);
            System.arraycopy(key, 0, b, 16, 8);
            key = (byte[]) null;
            return b;
        }
        System.err.println("密钥长度有误,期望值[16]");
        return null;
    }

    private static byte[] newInstance8Key(byte[] key) {
        if ((key != null) && (key.length == 8)) {
            byte[] b = new byte[24];
            System.arraycopy(key, 0, b, 0, 8);
            System.arraycopy(key, 0, b, 8, 8);
            System.arraycopy(key, 0, b, 16, 8);
            key = (byte[]) null;
            return b;
        }
        System.err.println("密钥长度有误,期望值[8]");
        return null;
    }
}
