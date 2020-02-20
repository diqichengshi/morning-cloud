package com.posp.ui.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.converter.pack.JBigInflateConverter;

/**
 * 
 * @author lenovo
 *
 */
public class ToolUtils {
	
	/**
	 * 
	 * @param cardNo
	 * @return  622262*********7783
	 */
	public static String replaceForBankCard(String cardNo){
		String s = cardNo.substring(6, cardNo.length()-4);
		String s1 = s.replaceAll(".", "*");
		return cardNo.replace(s, s1);
	}
	
	/**
	 * 银联签名图片转换
	 * @param data
	 * @param fileName
	 */
	public static void createImg(byte[] data, String fileName) {
		try {
			File file = new File(fileName + ".jbig");
			if(file.exists()) return;
			FileOutputStream fis = new FileOutputStream(file);
			fis.write(data);// 
			fis.flush();
			fis.close();

			JBigInflateConverter jic = new JBigInflateConverter();// 调用jar包里面的方法
			jic.DoConvert(fileName + ".jbig", fileName + ".jpg");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 银联签名图片转换
	 * @param data
	 * @param fileName
	 */
	@SuppressWarnings("unused")
	public static void createImg(InputStream in,int byteLength,String fileName) {
		try {
			File file = new File(fileName + ".jbig");
			FileOutputStream fis = new FileOutputStream(file);
			byte[] data = new byte[byteLength];
			int i = 0;
			while ((i = in.read(data)) != -1) {
				fis.write(data);// 
			}
			
			fis.flush();
			fis.close();

			JBigInflateConverter jic = new JBigInflateConverter();// 调用jar包里面的方法
			jic.DoConvert(fileName + ".jbig", fileName + ".jpg");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
            if (in != null) {
                try {
        			in.close();       			
                } catch (IOException e1) {
                }
            }
        }
	}
	
	/**
	 * 
	 * @param out
	 * @param fileName
	 */
	@SuppressWarnings("unused")
	public static void readImg(OutputStream out,String fileName){
        InputStream in = null;
        try {
            // 一次读多个字节
            byte[] tempbytes = new byte[1024];
            int byteread = 0;
            in = new FileInputStream(fileName);
            ToolUtils.showAvailableBytes(in);
            // 读入多个字节到字节数组中，byteread为一次读入的字节数
            while ((byteread = in.read(tempbytes)) != -1) {
            	out.write(tempbytes);
            }
        } catch (Exception e1) {
            e1.printStackTrace();
        } finally {
            if (in != null) {
                try {
                    out.close();
        			in.close();
                } catch (IOException e1) {
                }
            }
        }
	}
	
	/**
     * 显示输入流中还剩的字节数
     */
    public static int showAvailableBytes(InputStream in) {
    	int len = 0;
        try {
        	len = in.available();
            System.out.println("当前字节输入流中的字节数为:" + len);
            
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return len;
    }
    
    /** 
     * 删除单个文件 
     * @param   sPath    被删除文件的文件名 
     * @return 单个文件删除成功返回true，否则返回false 
     */  
    public static boolean deleteFile(String sPath) {  
        boolean flag = false;  
        File file = new File(sPath);  
        // 路径为文件且不为空则进行删除  
        if (file.isFile() && file.exists()) {  
            file.delete();  
            flag = true;  
        }  
        return flag;  
    }
    
    /** 
     *  根据路径删除指定的目录或文件，无论存在与否 
     *@param sPath  要删除的目录或文件 
     *@return 删除成功返回 true，否则返回 false。 
     */  
    public static boolean deleteFolder(String sPath) {  
        boolean flag = false;  
        File file = new File(sPath);  
        // 判断目录或文件是否存在  
        if (!file.exists()) {  // 不存在返回 false  
            return flag;  
        } else {  
            // 判断是否为文件  
            if (file.isFile()) {  // 为文件时调用删除文件方法  
                return deleteFile(sPath);  
            } else {  // 为目录时调用删除目录方法  
                return deleteDirectory(sPath);  
            }  
        }  
    }
    
    /** 
     * 删除目录（文件夹）以及目录下的文件 
     * @param   sPath 被删除目录的文件路径 
     * @return  目录删除成功返回true，否则返回false 
     */  
    public static boolean deleteDirectory(String sPath) {  
        //如果sPath不以文件分隔符结尾，自动添加文件分隔符  
        if (!sPath.endsWith(File.separator)) {  
            sPath = sPath + File.separator;  
        }  
        File dirFile = new File(sPath);  
        //如果dir对应的文件不存在，或者不是一个目录，则退出  
        if (!dirFile.exists() || !dirFile.isDirectory()) {  
            return false;  
        }  
        boolean flag = true;  
        //删除文件夹下的所有文件(包括子目录)  
        File[] files = dirFile.listFiles();  
        for (int i = 0; i < files.length; i++) {  
            //删除子文件  
            if (files[i].isFile()) {  
                flag = deleteFile(files[i].getAbsolutePath());  
                if (!flag) break;  
            } //删除子目录  
            else {  
                flag = deleteDirectory(files[i].getAbsolutePath());  
                if (!flag) break;  
            }  
        }  
        if (!flag) return false;  
        //删除当前目录  
        if (dirFile.delete()) {  
            return true;  
        } else {  
            return false;  
        }  
    }
    
    /**
     * 高位补0
     * @param target 源数字
     * @param position 补差总位
     * @return
     */
    public static String highFillZero(int target,int position){
		return String.format("%0"+position+"d", target);
	}
    
    /**
     * 转换日期格式
     * @param date
     * @param pattern
     * @return
     */
    public static String formatDate(String date,String patternSource,String patternTarget){
    	SimpleDateFormat format1 = new SimpleDateFormat(patternSource);
    	SimpleDateFormat format2 = new SimpleDateFormat(patternTarget);
    	try {
			return format2.format(format1.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	return null;
    }
    
    public static void main(String[] args) {
		System.out.println(ToolUtils.formatDate("20161210185454","yyyyMMddHHmmss","yyyy/MM/dd HH:mm:ss"));
	}
}
