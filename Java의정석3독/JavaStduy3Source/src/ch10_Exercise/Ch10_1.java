package ch10_Exercise;

import java.time.*;
import static java.time.DayOfWeek.*;
import static java.time.temporal.TemporalAdjusters.*;

import java.text.SimpleDateFormat;
import java.util.*;

public class Ch10_1 {
	public static void main(String[] args) {
		LocalDate today = LocalDate.of(2010, 1, 1);

		for (int i = 0; i < 11; i++) {
			today = today.plusMonths(1);
			System.out.println(today.with(dayOfWeekInMonth(2, SUNDAY)));
		}
		
		Calendar date = Calendar.getInstance();
		date.set(2010, Calendar.JANUARY, 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd은 F번째 E요일입니다.");
		

		for(int i=0; i<12; i++){
			// 일1 월2 화3 수4 목5 금6 토7
			// 1일이 월요일이면 14   월요일(2) - > 14    16에서 1일에 요일을 빼면 됨
			// 1일이 목요일이면 11  목(5)
			// 단 1일이 토요일이면 9
			int dow = date.get(Calendar.DAY_OF_WEEK);
			int secondSunday = dow==7 ? 9 : 16-dow;
			date.set(Calendar.DATE, secondSunday);
			Date d = date.getTime();
			System.out.println(sdf.format(d));
			date.add(Calendar.MONTH, 1);
			date.set(Calendar.DATE, 1);
		}
		
	}
}
