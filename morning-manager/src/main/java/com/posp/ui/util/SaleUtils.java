package com.posp.ui.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.commons.lang3.StringUtils;

/**
 * 签购单工具类
 * 
 * @author liwei
 *
 */
public class SaleUtils {

	/**
	 * 生成文件夹
	 * 
	 * @param filePath
	 */
	public static void generateFilePath(String filePath) {
		File file = new File(filePath);
		if (!file.exists()) {
			file.mkdirs();
		}
	}
	
	/**
	 * 拷贝图片
	 * 
	 * @param src
	 * @param target
	 */
	public static void copyImg(String target, InputStream in) {
		// 存在即返回
		File targetFile = new File(target);
		if (targetFile.exists()) {
//			targetFile.delete();
			return;
		}
		
		OutputStream out = null;
		try {
			out = new FileOutputStream(targetFile);
			byte[] bytes = new byte[1024];
			int len = -1;
			while ((len = in.read(bytes)) != -1) {
				out.write(bytes, 0, len);
			}
			in.close();
			out.close();
		} catch (FileNotFoundException e) {
			// e.printStackTrace();
		} catch (IOException e) {
			// e.printStackTrace();
		} finally {
			try {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			} catch (IOException e) {
				// e.printStackTrace();
			}
		}
	}
	
	/**
	 * 拷贝图片
	 * 
	 * @param src
	 * @param target
	 */
	public static void copyImg(String target, File srcFile) {
		// 存在即返回
		File targetFile = new File(target);
		if (targetFile.exists()) {
//			targetFile.delete();
			return;
		}

		InputStream in = null;
		OutputStream out = null;

		try {
			in = new FileInputStream(srcFile);
			out = new FileOutputStream(targetFile);
			byte[] bytes = new byte[1024];
			int len = -1;
			while ((len = in.read(bytes)) != -1) {
				out.write(bytes, 0, len);
			}
			in.close();
			out.close();
		} catch (FileNotFoundException e) {
			// e.printStackTrace();
		} catch (IOException e) {
			// e.printStackTrace();
		} finally {
			try {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			} catch (IOException e) {
				// e.printStackTrace();
			}
		}
	}
	
	/**
	 * 格式化消费名称
	 * @param transCode
	 * @param transName
	 * @return
	 */
	public static String formatTransName(String transCode,String transName,String inputMode){
		StringBuffer mBuffer = new StringBuffer(transName);
		//消费
		if("020000".equals(transCode)){
			mBuffer.append("(SAIE)");
		}
		//消费撤销
		if("020002".equals(transCode)){
			mBuffer.append("(VOID)");
		}
		//预授权
		if("024000".equals(transCode)){
			mBuffer.append("(AUTH)");
		}
		//预授权撤销
		if("024002".equals(transCode)){
			mBuffer.append("(CANCEL)");
		}
		//预授权完成
		if("024100".equals(transCode)){
			mBuffer.append("(AUTH COMPLETE)");
		}
		//预授权完成撤销
		if("024102".equals(transCode)){
			mBuffer.append("(COMPLETE VOID)");
		}
		//退货
		if("020001".equals(transCode)){
			mBuffer.append("(REFUND)");
		}
			
		//用卡方式
		if(StringUtils.isNotBlank(inputMode)){
			String tmp = formatInputMode(inputMode);
			if(tmp.length() > 0){
				mBuffer.append("(");
				mBuffer.append(tmp);
				mBuffer.append(")");
			}
		}
		
		return mBuffer.toString();
	}
	
	public static String formatInputMode(String inputMode){
		String tmp = inputMode.substring(0, 2);
		String rst = "";
		//刷卡
		if("02".equals(tmp)){
			rst = "S";
		}
		//插卡
		if("05".equals(tmp)){
			rst = "I";
		}
		//挥卡
		if("07".equals(tmp)){
			rst = "C";
		}
		//手输
		if("01".equals(tmp)){ 
			rst = "M";
		}
		return rst;
	}
	
	/**
	 * 格式化有效期
	 * @param edate
	 * @return
	 */
	public static String formatExpDate(String edate){
		StringBuffer mBuffer = new StringBuffer(edate);
		mBuffer.insert(2,"/");
		mBuffer.insert(0,"20");
		return mBuffer.toString();
	}
	
	/**
	 * 格式化交易日期
	 * @param transDate
	 * @param transTime
	 * @return
	 */
	public static String formatTrans(String transDate,String transTime){
		StringBuffer mBuffer = new StringBuffer(transDate);
		mBuffer.insert(6,"/");
		mBuffer.insert(4,"/");
		mBuffer.append(" ");
		StringBuffer mBuffer1 = new StringBuffer(transTime);
		mBuffer1.insert(4,":");
		mBuffer1.insert(2,":");
		mBuffer.append(mBuffer1.toString());
		
		return mBuffer.toString();
	}
}
