package com.fashion.common.format;

import java.text.NumberFormat;

public class MoneyFormat {
	public static String getResult(double data){
		NumberFormat format=NumberFormat.getInstance();
		return format.format(data);
		
	}
	/*public static void main(String[] args) {
		System.out.println(MoneyFormat.getResult(50000));
	}*/
}
