package ch10_Exercise;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Ch10_6 {

	public static void main(String[] args) {
		LocalDate birthday = LocalDate.of(2000, 1, 1);
		LocalDate today = LocalDate.of(2016, 1, 29);

		System.out.println(birthday);
		System.out.println(today);
		System.out.println(birthday.until(today, ChronoUnit.DAYS));
	}

}
