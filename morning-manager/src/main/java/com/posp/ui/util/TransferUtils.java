package com.posp.ui.util;
/**
 * 敏感数据加密显示
 * @author 59674
 *
 */
public class TransferUtils {
    /** 
     * 对字符串处理:将指定位置到指定位置的字符以星号代替 
     *  
     * @param content 
     *            传入的字符串 
     * @param begin 
     *            开始位置 
     * @param end 
     *            结束位置 
     * @return 
     */  
    public static String getStarString(String content, int begin, int end) {
        if (begin >= content.length() || begin < 0) {  
            return content;  
        }  
        if (end >= content.length() || end < 0) {  
            return content;  
        }  
        if (begin >= end) {  
            return content;  
        }  
        String starStr = "";
        for (int i = begin; i < end; i++) {  
            starStr = starStr + "*";  
        }  
        return content.substring(0, begin) + starStr + content.substring(end, content.length());  
  
    }  
    /** 
     * 对字符加星号处理：除前面几位和后面几位外，其他的字符以星号代替 
     *  
     * @param content 
     *            传入的字符串 
     * @param frontNum 
     *            保留前面字符的位数 
     * @param endNum 
     *            保留后面字符的位数 
     * @return 带星号的字符串 
     */  
  
    public static String getStarString2(String content, int frontNum, int endNum) {
  
        if (frontNum >= content.length() || frontNum < 0) {  
            return content;  
        }  
        if (endNum >= content.length() || endNum < 0) {  
            return content;  
        }  
        if (frontNum + endNum >= content.length()) {  
            return content;  
        }  
        String starStr = "";
        for (int i = 0; i < (content.length() - frontNum - endNum); i++) {  
            starStr = starStr + "*";  
        }  
        return content.substring(0, frontNum) + starStr  
                + content.substring(content.length() - endNum, content.length());  
  
    }
    public static void main(String[] args) {
		/*String name = "小泽玛利亚";
		System.out.println(TransferUtils.userNameReplaceWithStar(name));
		System.out.println(TransferUtils.userNameReplaceWithStart2(name));*/
    	//System.out.println(TransferUtils.getStarString2("1234567890123456789",6,4));
	}
    /**
     * 根据用户名的不同长度，来进行替换 ，达到保密效果，隐藏名字,显示姓
     *
     * @param userName 用户名
     * @return 替换后的用户名
     */
    public static String userNameReplaceWithStar(String userName) {
    	String firstName = userName.substring(0,1);
    	String str = userName.substring(1,userName.length());
        String userNameAfterReplaced = "";
        int nameLength = userName.length();
        if (nameLength <= 1) {
            userNameAfterReplaced = "*";
        } else if (nameLength > 1) {
            userNameAfterReplaced = firstName.replaceAll("([\\u4e00-\\u9fa5])","*"); 
        } 
        return userNameAfterReplaced+str;
    }
    /**
     * 根据用户名的不同长度，来进行替换 ，达到保密效果，隐藏姓,显示名字
     *
     * @param userName 用户名
     * @return 替换后的用户名
     */
    public static String userNameReplaceWithStart2(String userName) {
    	String firstName = "";
    	String str = "";
        String userNameAfterReplaced = "";
        int nameLength = userName.length();
        if(nameLength>3){
        	firstName = userName.substring(0,2);
        	str = userName.substring(2,userName.length());
        }else{
        	firstName = userName.substring(0,1);
        	str = userName.substring(1,userName.length());
        }
        if (nameLength <= 1) {
            userNameAfterReplaced = "*";
        } else if (nameLength > 1 ) {
            userNameAfterReplaced = str.replaceAll("([\\u4e00-\\u9fa5])","*"); 
        } 
        return firstName+userNameAfterReplaced;
    }
}
