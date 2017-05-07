package ch10_date_time_formatting;

import java.time.*;
import java.time.temporal.*;
import static java.time.DayOfWeek.*;  // Enum
import static java.time.temporal.TemporalAdjusters.*;


public class NewTimeEx3 {
	public static void main(String[] args) {
		LocalDate today = LocalDate.now();
		LocalDate date = today.with(new DayAfterTomorrow());
		
		System.out.println(today); // 2017-04-16
		System.out.println(date);	// 2017-04-18
		
		p(today.with(firstDayOfNextMonth()));	 // 다음 달의 첫 날
		p(today.with(firstDayOfMonth())); 		 // 이 달의 첫 날
		p(today.with(lastDayOfMonth())); 		 // 이 달의 마지막 날
		p(today.with(firstInMonth(TUESDAY)));    // 이 달의 첫번째 화요일
		p(today.with(lastInMonth(TUESDAY)));     // 이달의 마지막 화요일
		p(today.with(previous(TUESDAY)));		 // 지난 주 화요일
		p(today.with(previousOrSame(TUESDAY)));	 // 지난 주 화요일(오늘 포함)
		p(today.with(next(TUESDAY)));			 // 다음 주 화요일
		p(today.with(nextOrSame(TUESDAY)));		 // 다음 주 화요일(오늘 포함)
		p(today.with(dayOfWeekInMonth(4,TUESDAY))); // 이 달의 4번째 화요일
	}
	
	static void p(Object obj){
		System.out.println(obj);
	}
}

class DayAfterTomorrow implements TemporalAdjuster{

	@Override
	public Temporal adjustInto(Temporal temporal) {
		return temporal.plus(2,ChronoUnit.DAYS);
	}
}
