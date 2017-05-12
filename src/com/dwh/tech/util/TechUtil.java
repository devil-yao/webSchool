package com.dwh.tech.util;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

public class TechUtil {

	public static String techNo(){
		Date date = new Date();
		Random random = new Random();
		int r = random.nextInt(1000);
		return date.getTime()+""+r;
	}
	
	public static String dateString(Date date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(date);
	}
	
	public static String fileName(){
		UUID uuid = UUID.randomUUID();
		String uid = uuid.toString().replaceAll("-", "");
		return uid;
	}
	
	public static void main(String[] args) {
//		System.out.println(techNo());
		System.out.println(dateString(new Date()));
//		System.out.println(fileName());
//		System.out.println(orderNo());
	}
	
	public static Double format2(Double price){
		DecimalFormat df = new DecimalFormat(".00");
		String dd = df.format(price);
		return Double.parseDouble(dd);
	}
	
	public static String orderNo(){
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMDDHHmmss");
		String dataString = format.format(new Date());
		Random random = new Random();
		int num = random.nextInt(1000);
		return dataString+num;
	}
	
}
