package ch10_data_time_formatting;

import java.util.*;

public class CalendarEx4 {
	public static void main(String[] args) {
		Calendar date = Calendar.getInstance();
		
		date.set(2005, Calendar.AUGUST, 31);
		System.out.println(toString(date));
		System.out.println("= 1일 후 = ");
		date.add(Calendar.DATE, 1);
		System.out.println(toString(date));
		
		System.out.println("= 6달 전 =");
		date.add(Calendar.MONTH, -6);
		System.out.println(toString(date));
		
		// 다른 필드에 영향을 미치지 않음
		System.out.println("= 31일 후(roll) = ");
		date.roll(Calendar.DATE, 31);
		System.out.println(toString(date));
		
		System.out.println("= 31일 후 (add) = ");
		date.add(Calendar.DATE, 31);
		System.out.println(toString(date));
		
		// 말일로 설정
		date.set(Calendar.MONTH, Calendar.JANUARY);
		date.set(Calendar.DATE,date.getActualMaximum(Calendar.DATE));
		System.out.println("말일로설중후 : " + toString(date));
		// 예외 일이 그 달의 마지막날일 때, 달을 바꾸면 일이 바뀔 수 있다. 
		// 말일(31,30, 28,29)
		
		System.out.println("= 1달 후  (roll) = ");
		date.roll(Calendar.MONTH, 3);
		System.out.println(toString(date));
	}

	private static String toString(Calendar date) {
		return date.get(Calendar.YEAR) + "년  " + (date.get(Calendar.MONTH)+1)+"월 "
				+ date.get(Calendar.DATE)+ "일";
	}
}
