package ch10_date_time_formatting;

import java.time.*;

public class NewTimeEx2 {
	public static void main(String[] args) {
		LocalDate date = LocalDate.of(2015, 12, 31);
		LocalTime time = LocalTime.of(12, 34, 56);
		
		//2015년 12월 31일 12시 34분 56초
		LocalDateTime dt = LocalDateTime.of(date, time);
		
		ZoneId zid = ZoneId.of("Asia/Seoul");
		ZonedDateTime zdt = dt.atZone(zid);
		System.out.println(zdt.getZone().getId());  // Asia/Seoul
		
		ZonedDateTime seoulTime = ZonedDateTime.now();
		ZoneId nyId = ZoneId.of("America/New_York");
		ZonedDateTime nyTime = ZonedDateTime.now().withZoneSameInstant(nyId);
		
		// ZonedDateTime -> OffsetDateTime
		OffsetDateTime odt = zdt.toOffsetDateTime();
		
		System.out.println(dt); // 2015-12-31T12:34:56
		System.out.println(zid); // Asia/Seoul
		System.out.println(zdt);  /// 2015-12-31T12:34:56+09:00[Asia/Seoul]
		System.out.println(seoulTime); // 2017-04-16T17:23:16.641+09:00[Asia/Seoul]
		System.out.println(nyTime); //    2017-04-16T04:23:16.644-04:00[America/New_York]
		System.out.println(odt); // 2015-12-31T12:34:56+09:00
	}
}
