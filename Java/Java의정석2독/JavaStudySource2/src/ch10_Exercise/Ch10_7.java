package ch10_Exercise;

import static java.time.DayOfWeek.TUESDAY;
import static java.time.temporal.TemporalAdjusters.dayOfWeekInMonth;

import java.time.LocalDate;

public class Ch10_7 {
	public static void main(String[] args) {
		LocalDate date = LocalDate.of(2016, 12, 1);
		System.out.println(date.with(dayOfWeekInMonth(4,TUESDAY)));

	}
}
