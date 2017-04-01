package ch10;

import java.util.*;

public class CalendarEx4 {
	public static void main(String[] args) {
		Calendar date = Calendar.getInstance();
		
		date.set(2005,7,31);  // 2005년 8월 13일
		
		System.out.println(toString(date));
		System.out.println("= 1일 후 =");
		date.add(Calendar.DATE, 1);
		System.out.println(toString(date));
		
		System.out.println("= 6달 전 =");
		date.add(Calendar.MONTH, -6);
		System.out.println(toString(date));
		
		System.out.println("= 31일 후(roll)=");  
		date.roll(Calendar.DATE, 31);
		System.out.println(toString(date));
		// roll 필드가 다른 필드에 영향을 미치지 않는다.
		// 단 '일'필드가 말일 일 때, 월필드가 변경되면 영향을 미칠 수 있다.
		//CalendarEx5 참조
		
		
		System.out.println("= 31일 후(date)=");
		date.add(Calendar.DATE, 31);
		System.out.println(toString(date));
		
		
	}
	public static String toString(Calendar date){
		return date.get(Calendar.YEAR) + "년 " + (date.get(Calendar.MONTH)+1) 
							+ "월 " +date.get(Calendar.DATE)+"일 ";
	}
}
/*
	2005년 8월 31일 
	= 1일 후 =
	2005년 9월 1일 
	= 6달 전 =
	2005년 3월 1일 
	= 31일 후(roll)=
	2005년 3월 1일 
	= 31일 후(date)=
	2005년 4월 1일 
*/
