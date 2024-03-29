package ch10;

import java.util.Calendar;

public class CalendarEx5 {
	public static void main(String[] args) {
		Calendar date = Calendar.getInstance();
		
		date.set(2015, Calendar.JANUARY, 31); // 2005년 1월 31일
		System.out.println(toString(date));
		date.roll(Calendar.MONTH,1);
		System.out.println(toString(date));
		
		date.set(2015, Calendar.JANUARY, 31); // 2005년 1월 31일
		date.add(Calendar.MONTH,1);
		System.out.println(toString(date));

	}
	public static String toString(Calendar date){
		return date.get(Calendar.YEAR) + "년 " + (date.get(Calendar.MONTH)+1) 
							+ "월 " +date.get(Calendar.DATE)+"일 ";
	}
}
/*
 * 2015년 1월 31일에 대해 roll()을 호출해서 월 필드를 1 증가시켰을 때,
 * 월 필드는 2월이 되는데 2월에는 31일이 없기 때문에 2월의 말일인 28일로 자동 변경
 * abb()도 마찬가지
 */
//2015년 1월 31일 
//2015년 2월 28일 

