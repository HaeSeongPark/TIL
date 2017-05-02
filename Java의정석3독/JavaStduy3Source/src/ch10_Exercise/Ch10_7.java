package ch10_Exercise;

import static java.time.DayOfWeek.*;
import java.time.LocalDate;
import static java.time.temporal.TemporalAdjusters.*;

public class Ch10_7 {
	public static void main(String[] args) {
		LocalDate date = LocalDate.of(2016, 12, 1);
		date = date.with(dayOfWeekInMonth(4, TUESDAY));
		System.out.println(date);
	}
}
