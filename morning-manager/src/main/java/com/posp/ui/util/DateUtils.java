package com.posp.ui.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author liwei
 *
 */
public class DateUtils {

	/**
	 * 判断2个日期是否在同一个月
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static boolean dateSameMonthFormat(Date date1, Date date2) {
        Calendar calendar1 = Calendar.getInstance();
        calendar1.setTime(date1);
        Calendar calendar2 = Calendar.getInstance();
        calendar2.setTime(date2);
//        int year1 = calendar1.get(Calendar.YEAR);
//        int year2 = calendar2.get(Calendar.YEAR);
//        int month1 = calendar1.get(Calendar.MONTH);
//        int month2 = calendar2.get(Calendar.MONTH);
//        System.out.println(year1 + "  " + month1);
//        System.out.println(year2 + "  " + month2);
        return calendar1.get(Calendar.YEAR) == calendar2.get(Calendar.YEAR) && calendar1.get(Calendar.MONTH) == calendar2.get(Calendar.MONTH);
    }

	/**
	 * 判断2个日期是否在同一个月
	 * @param date1(YYYYMMDD)
	 * @param date2(YYYYMMDD)
	 * @return
	 * @throws ParseException
	 */
	public static boolean dateSameMonth(String date1, String date2) throws ParseException {
		Date dateTmp1= new SimpleDateFormat("yyyyMMdd").parse(date1);
		Date dateTmp2= new SimpleDateFormat("yyyyMMdd").parse(date2);
		return dateSameMonthFormat(dateTmp1,dateTmp2);
	}

	public static void main(String[] args) throws ParseException {
		// 表示我也没什么用过日历类去处理时间，大概思路就是去判断是否同一年and是否同一月
//		System.out.println(equals(new Date(), new Date(new Date().getTime() + 1500000000l)));
//		System.out.println(equals(new Date(), new Date(new Date().getTime() + 3000000000l)));
//		System.out.println(dateSameMonth("20181101","20181230"));

	}
}
