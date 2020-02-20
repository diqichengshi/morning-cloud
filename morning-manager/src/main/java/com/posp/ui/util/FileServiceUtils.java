package com.posp.ui.util;

import java.io.*;
import java.nio.charset.Charset;
import java.util.List;

/**
 * 文件操作类
 * @author lenovo
 *
 */
public class FileServiceUtils {

	/**
	 * 写文件
	 * @param list            文件内容
	 * @param filePath        文件路径
	 * @param fileName        文件名称
	 * @throws IOException
	 */
	public static <T> String writeFile(List<T> list,String filePath,String fileName) throws IOException{
		BufferedWriter writer = null;
		try {
            writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath+fileName)
            				,Charset.forName("GBK")));
            for(T t:list){
            	writer.write(t.toString());
            	writer.newLine();
            }
            writer.flush();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }catch (IOException e) {
            e.printStackTrace();
        }finally{
            try {
                writer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

		return filePath;
	}
	
	/**
	 * 追加写文件
	 * @param list            文件内容
	 * @param filePath        文件路径
	 * @param fileName        文件名称  
	 * @param newLine         是否换行  是：true 否：false
	 * @throws IOException
	 */
	public static <T> String appendFile(List<T> list,String filePath,String fileName,boolean newLine) throws IOException{
		BufferedWriter writer = null;
		try {
            writer = new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(filePath+fileName,true),Charset.forName("GBK")));
            String line = "";
            if(newLine){
            	line = "\r\n";
            }
            for(T t:list){
            	writer.write(t.toString()+line);
            }
            writer.flush();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }catch (IOException e) {
            e.printStackTrace();
        }finally{
            try {
                writer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

		return filePath;
	}

	/**
	 * 创建文件夹
	 */
	public static String mkdirs(String filePath){
		File file = new File(filePath);
		if(!file.exists()){
			file.mkdirs();
		}
		return filePath;
	}
}
