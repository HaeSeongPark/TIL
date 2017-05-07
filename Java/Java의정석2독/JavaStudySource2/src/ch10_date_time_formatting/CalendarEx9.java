package ch10_date_time_formatting;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CalendarEx9 {
	public static void main(String[] args) {
		System.out.println("2014.5.31 : " + getDayOfWeek(2014, 5, 31));
		System.out.println("2012.6. 1 : " + getDayOfWeek(2012, 6, 1));
		System.out.println("2014. 5. 1 - 2014.4.28 :" + dayDiff(2014, 05, 01, 2014, 04, 28));
		System.out.println("2015. 6. 29 : " + convertDateToDay(2015, 6, 29));
		System.out.println("735778 : " + convertDayToDate(735778));
	}

	// 달의 날짜 수
	public static int[] endOfMonth = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

	public static boolean isLeapYear(int year) {
		// 4로 나눠떨어지면서 100으로 나눠떨어지지 않는 수 와 400으로 나눠떨어지는 수
		return (year%4==0) && (year%100!=0) || (year%400==0);
	}

	public static long dayDiff(int y1, int m1, int d1, int y2, int m2, int d2) {
		// 두 날짜간의 차이를 일단위로 반환한다.
		// 아래방법말고 뭐 없나?
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
//		long diffDays = 0;
//		try {
//			Date beginDate = formatter.parse(y1+""+m1+d1);
//			Date endDate = formatter.parse(y2+""+m2+d2);
//			
//			long diff = endDate.getTime() - beginDate.getTime();
//			diffDays = diff / (60*60*24*1000);
//			
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		return diffDays;
		return convertDateToDay(y1, m1, d1) - convertDateToDay(y2, m2, d2);
	}

	public static int getDayOfWeek(int year, int month, int day) {
		// 지정한 날짜의 요일을 반환한다. (1-7, 1이 일요일)
//		return convertDateToDay(year, month, day) % 7 + 1;
		 Calendar cal = Calendar.getInstance();
		 cal.set(year, month-1,day);
		 return cal.get(Calendar.DAY_OF_WEEK);
	}
	
	// 년월일을 입력받아서 일단위로 변환
	public static int convertDateToDay(int year, int month, int day) {		
		// 윤년 수
		int numOfLeapYear = year/4 - year/100 + year/400;
		
//		// 전년도까지의 윤년의 수를 구한다.
//		for(int i=1; i<year; i++){
//			if(isLeapYear(i))
//				numOfLeapYear++;
//		}
		
		
		// 전년도까지의 일수를 구한다.
		int toLastYearDaySum = (year-1) * 365 + numOfLeapYear;

		// 올해의 현재 월까지의 일수 계산
		int thisYearDaySum = 0;

		for(int i=0; i<month-1; i++){
			thisYearDaySum += endOfMonth[i];
		}
		
		if(month>2 && isLeapYear(year))
			thisYearDaySum++;
		
		thisYearDaySum+=day;

		return toLastYearDaySum+thisYearDaySum;
	}
	
	// 일단위의 값을 년월일의 형태의 문자열로 변환하여 반환
	public static String convertDayToDate(int day) {
		// 서기 1월 1일부터
		int year=1;
		int month=0;
		
		while(true){
			int yearDays = isLeapYear(year) ? 366 : 365;
			if(day > yearDays){
				day -= yearDays;
				year++;
			} else break;
		}
		
		while(true){
			int endDay = endOfMonth[month];
			if(day > endDay){
				day -= endDay;
				month++;
			} else break;
		}

		return year + "-" + (month+1) + "-" + day;
	}
}
