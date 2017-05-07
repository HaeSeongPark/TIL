package ch10_date_time_formatting;

import java.text.SimpleDateFormat;
import java.util.*;

public class DateCalendar {
	public static void main(String[] args) {
		// Calendar를 Date로 변환
		Calendar cal = Calendar.getInstance();
		// 1
		Date d = new Date(cal.getTimeInMillis());
		// 2
		Date d2 = cal.getTime();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		System.out.println(sdf.format(d));
		System.out.println(sdf.format(d2));
		
		// Date를 Calendar로 변환
		Date d3 = new Date();
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(d3);
		System.out.println(cal2.get(Calendar.YEAR));
		
	}
}
