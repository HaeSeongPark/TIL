package ch10_data_time_formatting;

import java.util.*;

public class CalendarEx3 {
	public static void main(String[] args) {
		final int[] TIME_UNIT = {3600, 60, 1};
		final String[] TIME_UNIT_NAME = {"시간","분","초"};
		
		Calendar time1 = Calendar.getInstance();
		Calendar time2 = Calendar.getInstance();
		
		time1.set(Calendar.HOUR, 10);
		time1.set(Calendar.MINUTE,20);
		time1.set(Calendar.SECOND, 30);
		
		time2.set(Calendar.HOUR, 30);
		time2.set(Calendar.MINUTE, 20);
		time2.set(Calendar.SECOND, 10);
		
		System.out.println("time1:"+ time1.get(Calendar.HOUR_OF_DAY)+"시"
				+ time1.get(Calendar.MINUTE) + "분 " + time1.get(Calendar.SECOND) + "초");
		System.out.println("time2 :" + time2.get(Calendar.HOUR_OF_DAY)+" 시"
				+ time2.get(Calendar.MINUTE) +"분 "+ time2.get(Calendar.SECOND)+ "초");
		long diff = Math.abs(time2.getTimeInMillis()-time1.getTimeInMillis()) / 1000;
		System.out.println("시간차"+diff);
		String tmp = "";
		for(int i=0; i<TIME_UNIT.length; i++){
			tmp += diff/TIME_UNIT[i] + TIME_UNIT_NAME[i];
			diff %=  TIME_UNIT[i];
		}
		System.out.println("시간차 : " + tmp);
	}
}
