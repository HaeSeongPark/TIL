package ch10_Exercise;

import java.time.*;

public class Ch10_8 {
	public static void main(String[] args) {
		ZonedDateTime zdt = ZonedDateTime.now();
		ZoneId nyId = ZoneId.of("America/New_York");
		ZonedDateTime zdtNY = ZonedDateTime.now().withZoneSameInstant(nyId);
		
		System.out.println(zdt);
		System.out.println(zdtNY);
		
		long sec1 = zdt.getOffset().getTotalSeconds();
		long sec2 = zdtNY.getOffset().getTotalSeconds();
		long diff = (sec1-sec2)/(60*60);
		
		System.out.println("sec1="+sec1);
		System.out.println("sec2="+sec2);
		System.out.printf("diff=%d hrs%n",diff);
	}
}
