package ch10_data_time_formatting;

import java.time.*;
import java.time.temporal.TemporalAdjuster;
import java.time.temporal.TemporalAdjusters;

public class NewTimeEx2 {
	public static void main(String[] args) {
		LocalDate date = LocalDate.of(2015, 12, 31);
		LocalTime time = LocalTime.of(12, 34,56);
		
		LocalDateTime dt = LocalDateTime.of(date, time);
		
		ZoneId zid = ZoneId.of("Asia/Seoul");
		ZonedDateTime zdt = dt.atZone(zid);
		String strZid = zdt.getZone().getId();
		
		ZonedDateTime seoulTime = ZonedDateTime.now();
		ZoneId nyId = ZoneId.of("America/New_York");
		ZonedDateTime nyTime = ZonedDateTime.now().withZoneSameInstant(nyId);
		
		// ZonedDatetime -> OffsetDateTime
		OffsetDateTime odt = zdt.toOffsetDateTime();
		
		System.out.println(dt);
		System.out.println(zid);
		System.out.println(strZid);
		System.out.println(zdt);
		System.out.println(seoulTime);
		System.out.println(nyTime);
		System.out.println(odt);
		
		LocalDate today = LocalDate.now();
		LocalDate nextMonday = today.with(TemporalAdjusters.next(DayOfWeek.MONDAY));
		LocalDate in2WeekMonday = today.with(TemporalAdjusters.dayOfWeekInMonth(3, DayOfWeek.MONDAY));
		System.out.println(in2WeekMonday);
		System.out.println(nextMonday);
	}
}
