package ch10;

import java.time.*;

public class NewTimeEx2 {
	public static void main(String[] args) {
		LocalDate date = LocalDate.of(2015, 12, 31); // 2015년 12월 31일
		LocalTime time = LocalTime.of(12, 34,56);
		
		//2015년 12월 31일 12시 34분 56초
		LocalDateTime dt = LocalDateTime.of(date, time);
		
		ZoneId zid = ZoneId.of("Asia/Seoul");
		ZonedDateTime zdt = dt.atZone(zid);
//		String strZid = zdt.getZone().getId();
		
		ZonedDateTime seoulTime = ZonedDateTime.now();
		ZoneId nyId = ZoneId.of("America/New_York");
		ZonedDateTime nyTime = ZonedDateTime.now().withZoneSameInstant(nyId);
		
		//ZonedDatetime -> OffsetDateTime
		OffsetDateTime odt = zdt.toOffsetDateTime();
		
		System.out.println(dt);
		System.out.println(zid);
		System.out.println(zdt);
		System.out.println(seoulTime);
		System.out.println(nyTime);
		System.out.println(odt);
	}
	/*
	 *  2015-12-31T12:34:56
		Asia/Seoul
		2015-12-31T12:34:56+09:00[Asia/Seoul]
		2017-01-27T20:58:06.009+09:00[Asia/Seoul]
		2017-01-27T06:58:06.013-05:00[America/New_York]
		2015-12-31T12:34:56+09:00

	 */
}
