package ch10_data_time_formatting;

import java.time.*;
import java.time.temporal.*;
import static java.time.DayOfWeek.*;
import static java.time.temporal.TemporalAdjusters.*;

public class NewTimeEx3 {
	public static void main(String[] args) {
		LocalDate today = LocalDate.now();
		LocalDate date = today.with(new DayAfgerTomorrow());
		
		p(today);
		p(date);
		
		p("다음 달의 첫 날"+today.with(firstDayOfNextMonth()));	 // 다음 달의 첫 날
		p("이 달의 첫날 "+today.with(firstDayOfMonth())); 		 // 이 달의 첫 날
		p("이 달의 마지막 날"+today.with(lastDayOfMonth())); 		 // 이 달의 마지막 날
		p("이 달의 첫번째 화요일"+today.with(firstInMonth(TUESDAY)));    // 이 달의 첫번째 화요일
		p("이달의마지막화요일"+today.with(lastInMonth(TUESDAY)));     // 이달의 마지막 화요일
		
		System.out.println();
		
		p("지난 주 화요일"+today.with(previous(TUESDAY)));		 // 지난 주 화요일
		p("지난 주 화요일(오늘포함)"+today.with(previousOrSame(TUESDAY)));	 // 지난 주 화요일(오늘 포함)
		
		p(today.with(next(TUESDAY)));			 // 다음 주 화요일
		p(today.with(nextOrSame(TUESDAY)));		 // 다음 주 화요일(오늘 포함)
		p(today.with(dayOfWeekInMonth(4,TUESDAY))); // 이 달의 4번째 화요일
	}
	
	static void p(Object obj){
		System.out.println(obj);
	}
}

class DayAfgerTomorrow implements TemporalAdjuster{

	@Override
	public Temporal adjustInto(Temporal temporal) {
		return temporal.plus(2,ChronoUnit.DAYS);
	}
	
}
