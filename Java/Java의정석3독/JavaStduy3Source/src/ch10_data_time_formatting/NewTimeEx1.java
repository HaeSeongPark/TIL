package ch10_data_time_formatting;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.temporal.ChronoField;
import java.time.temporal.ChronoUnit;
import java.util.Iterator;
import java.util.Set;

public class NewTimeEx1 {
	public static void main(String[] args) {
		LocalDate today = LocalDate.now();
		LocalTime now = LocalTime.now();
		
		LocalDate birthDate = LocalDate.of(1999, 12, 31);
		LocalTime birthTime = LocalTime.of(23, 59,59);
		
		System.out.println("today="+today);
		System.out.println("now="+now);
		System.out.println("bithDate="+birthDate);   // 1999-12-31
		System.out.println("birthTime="+birthTime);  // 23:59:59
		
		// 3개 다 1999,12,31일 기준
		System.out.println(birthDate.withYear(2000));
		System.out.println(birthDate.plusDays(1));
		System.out.println(birthDate.plus(1, ChronoUnit.DAYS));
		
		//23:59:59 -> 23 : 00
		System.out.println(birthTime.truncatedTo(ChronoUnit.HOURS));
		
		//특정 ChronoField의 범위를 알아내는 방법
		System.out.println(ChronoField.CLOCK_HOUR_OF_DAY.range());  //1-24
		System.out.println(ChronoField.HOUR_OF_DAY.range());      // 0-23
		
		Set<String> zoneId = ZoneId.getAvailableZoneIds();
		Iterator<String> iterator = zoneId.iterator();
		
		while(iterator.hasNext()){
			System.out.println(iterator.next());
		}
		
		ZoneId nyId = ZoneId.of("America/New_York");
		ZonedDateTime nyTime = ZonedDateTime.now().withZoneSameInstant(nyId);
		System.out.println();
	}
}
