package ch10_Exercise;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Ch10_6 {
	public static void main(String[] args) {
		LocalDate birthDay = LocalDate.of(2000, 01, 01);
		LocalDate today = LocalDate.of(2016, 01, 29);
		
		System.out.println(birthDay.until(today,ChronoUnit.DAYS));
	}
}
