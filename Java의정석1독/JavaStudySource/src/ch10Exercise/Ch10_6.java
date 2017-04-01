package ch10Exercise;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Ch10_6 {

	public static void main(String[] args) {
		LocalDate birthday = LocalDate.of(1990, 06, 24);
		LocalDate today = LocalDate.now();
		
		System.out.println(birthday.until(today, ChronoUnit.DAYS));
	}

}
