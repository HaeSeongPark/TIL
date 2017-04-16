package ch10_date_time_formatting;

import java.time.*;
import java.time.temporal.ChronoField;
import java.time.temporal.ChronoUnit;

public class NewTimeEx1 {
	public static void main(String[] args) {
		LocalDate today = LocalDate.now();
		LocalTime now = LocalTime.now();
		
		LocalDate birthDate = LocalDate.of(1999, 12, 31);  // 1999년 12월 31일
		LocalTime birthTime = LocalTime.of(23, 59,59); // 23시 59분 59초
		
		System.out.println("today="+today);    
		System.out.println("now="+now);
		System.out.println("birthDate="+birthDate);
		System.out.println("birthTime="+birthTime);
													   // 원본 변경 x, 변경하면 새로운 객체 생성함 쓰레드에 안전
		System.out.println(birthDate.withYear(2000));  //2000-12-31
		System.out.println(birthDate.plusDays(1));     //2000-01-01
		System.out.println(birthDate.plus(1,ChronoUnit.DAYS)); // 2000-01-01
		
		//23:59:59 -> 23 : 00
		System.out.println(birthTime.truncatedTo(ChronoUnit.HOURS));
		
		//특정 ChronoField의 범위를 알아내는 방법
		System.out.println(ChronoField.CLOCK_HOUR_OF_DAY.range()); // 1-24
		System.out.println(ChronoField.HOUR_OF_DAY.range());       // 0-23
	}
}
