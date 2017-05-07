package ch10_Exercise;

import java.time.*;
import java.time.temporal.ChronoField;

public class Ch10_8 {
	public static void main(String[] args) {
		
//		ZoneId seoulId = ZoneId.of("Asia/Seoul");
		ZoneId nyId = ZoneId.of("America/New_York");
		
//		ZonedDateTime seoulTime = ZonedDateTime.now().withZoneSameInstant(seoulId);
		ZonedDateTime seoulTime = ZonedDateTime.now();
		ZonedDateTime nYTime = ZonedDateTime.now().withZoneSameInstant(nyId);
		
		System.out.println(seoulTime);
		System.out.println(nYTime);
		
		long seoulOffsetInsec = seoulTime.getOffset().get(ChronoField.OFFSET_SECONDS);
//		long sec1 = seoulTime.getOffset().getTotalSeconds();
		long nyyOffsetInsec = nYTime.getOffset().get(ChronoField.OFFSET_SECONDS);
		long diff = Math.abs(seoulOffsetInsec-nyyOffsetInsec) / 3600;
		
		System.out.println(seoulOffsetInsec);
		System.out.println(nyyOffsetInsec);
		System.out.println("diff="+diff+"hrs");
		
	}
}
