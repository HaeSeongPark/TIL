package ch10_Exercise;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;

public class Ch10_5 {
	
	static int getDayDiff(String yyyymmdd1, String yyyymmdd2){
		// yyyymmdd형식의 두 문자열을 넘겨받으면 두 날짜의 차이를 일(day)단위로 반환
		// 단, 첫 번째 날짜 빼기 두 번째 날짜의 결과를 반환
		// 만일 주어진 문자열이 유효하지 앟으면 0을 반환
		
		try {
			LocalDate date1 = LocalDate.parse(yyyymmdd1, DateTimeFormatter.BASIC_ISO_DATE);
			LocalDate date2 = LocalDate.parse(yyyymmdd2, DateTimeFormatter.BASIC_ISO_DATE);
			
			long daydiff = date1.until(date2, ChronoUnit.DAYS);
			
			return Math.abs((int)daydiff);
		} catch (Exception e) {
			return 0;
		}
		
//		DateFormat df = new SimpleDateFormat("yyyymmdd");
//		int dayDiff = 0;
//		try {
//			Date d1 = df.parse(yyyymmdd1);
//			Date d2 = df.parse(yyyymmdd2);
//			
//			
//			Calendar c1 = Calendar.getInstance();
//			Calendar c2 = Calendar.getInstance();
//			c1.setTime(d1);
//			c2.setTime(d2);
//			
//			int c1Year = c1.get(Calendar.YEAR);
//			int c1Month = c1.get(Calendar.MONTH);
//			int c1Date = c1.get(Calendar.DATE);
//			
//			int c2Year = c2.get(Calendar.YEAR);
//			int c2Month = c2.get(Calendar.MONTH);
//			int c2Date = c2.get(Calendar.DATE);
//			
//			
//			
//		} catch (ParseException e) {
//			return 0;
//		}
//		
//		return dayDiff;
	}
	
	public static void main(String[] args) {
		System.out.println(getDayDiff("20010103","20010101"));
		System.out.println(getDayDiff("20010103","20010103"));
		System.out.println(getDayDiff("20010103","200103"));
	}
}
