package ch10_date_time_formatting;

import java.util.Calendar;

public class CalendarEx3 {
	public static void main(String[] args) {
		final int[] TIME_UNIT = { 3600, 60 ,1 };
		final String[] TIME_UNIT_NAME = { "시간", "분", "초" };
		
		Calendar time1 = Calendar.getInstance();
		Calendar time2 = Calendar.getInstance();
		
		// time1의 시간을 10시 20분 30초로 설정
		time1.set(Calendar.HOUR_OF_DAY, 10);
		time1.set(Calendar.MINUTE, 20);
		time1.set(Calendar.SECOND, 30);
		
		// time2의 시간을 20시 30분 10초로 설정
		time2.set(Calendar.HOUR_OF_DAY, 20);
		time2.set(Calendar.MINUTE, 30);
		time2.set(Calendar.SECOND,10);
		
		System.out.println("time1 : " + time1.get(Calendar.HOUR_OF_DAY) + "시"
						   + time1.get(Calendar.MINUTE) + "분"
						   + time1.get(Calendar.SECOND) + "초");
		
		System.out.println("time2 : " + time2.get(Calendar.HOUR_OF_DAY) + "시"
				   + time2.get(Calendar.MINUTE) + "분"
				   + time2.get(Calendar.SECOND) + "초");
		
		long diff = Math.abs(time2.getTimeInMillis() - time1.getTimeInMillis()) / 1000;
		
		System.out.println("time1과 time2의 차이는 " + diff + "초입니다.");
		
		StringBuffer sb = new StringBuffer();
		for(int i=0; i<TIME_UNIT.length; i++){
			sb.append(diff / TIME_UNIT[i] + TIME_UNIT_NAME[i]);
			diff %= TIME_UNIT[i];
		}
		
		System.out.println("시분초로 변환하면" + sb + "입니다.");
	}
}
