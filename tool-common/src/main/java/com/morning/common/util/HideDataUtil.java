package com.morning.common.util;


import org.apache.commons.lang.StringUtils;

/**
 * @author lw
 * @Description 隐藏数据工具类
 */
public class HideDataUtil {
    /**
     * 前六后四 隐藏银行卡号，身份证号
     *
     * @param cardNo
     * @return java.lang.String
     */
    public static String hideCardNo(String cardNo) {
        if (StringUtils.isBlank(cardNo)) {
            return cardNo;
        }
        if (cardNo.length() > 10) {
            //前六后四
            StringBuilder stringBuilder = new StringBuilder();
            return stringBuilder.append(cardNo.substring(0, 6)).append(HideDataUtil.getMask(cardNo.length()-10))
                    .append(cardNo.substring(cardNo.length() - 4)).toString();
        } else {
            return cardNo;
        }
    }

    /**
     * 前三后四 隐藏手机号
     *
     * @param phoneNo
     * @return java.lang.String
     */
    public static String hidePhoneNo(String phoneNo) {
        if (StringUtils.isBlank(phoneNo)) {
            return phoneNo;
        }
        if (phoneNo.length() > 7) {
            //前三后四
            StringBuilder stringBuilder = new StringBuilder();
            return stringBuilder.append(phoneNo.substring(0, 3)).append(HideDataUtil.getMask(phoneNo.length()-7))
                    .append(phoneNo.substring(phoneNo.length() - 4)).toString();
        } else {
            return phoneNo;
        }
    }

    /**
     * 前前一后一  隐藏姓名
     *
     * @param name
     * @return java.lang.String
     */
    public static String hideName(String name) {
        if (StringUtils.isBlank(name)) {
            return name;
        }
        if (name.length() > 2) {
            //前一后一
            StringBuilder stringBuilder = new StringBuilder();
            return stringBuilder.append(name.substring(0, 1)).append(HideDataUtil.getMask(name.length()-2))
                    .append(name.substring(name.length() - 1)).toString();
        } else if (name.length() == 2) {
            //前一后一
            StringBuilder stringBuilder = new StringBuilder();
            return stringBuilder.append(name.substring(0, 1)).append("*").toString();
        } else {
            return name;
        }

    }
    
    public static String getMask(int len) {
    	StringBuilder stringBuilder = new StringBuilder();
    	for(int i = 0;i<len;i++) {
    		stringBuilder.append("*");
    	}
    	return stringBuilder.toString();
    }
    
    public static void main(String[] args) {
		System.out.println(HideDataUtil.hideCardNo("6212143000000000011"));
		System.out.println(HideDataUtil.hideCardNo("6212143000000001"));
		System.out.println(HideDataUtil.hidePhoneNo("13111111111"));
		System.out.println(HideDataUtil.hideName("银联一"));
		System.out.println(HideDataUtil.hideName("银联"));
		System.out.println(HideDataUtil.hideName("银联一银联一银联一银联一银联一银联一"));
	}
}