package ch10_data_time_formatting;

import java.util.*;

public class CalendarEx2 {
	public static void main(String[] args) {
		Calendar cal1 = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		
		cal1.set(2017, Calendar.APRIL, 1);
		
		System.out.println(cal2.after(cal1));
		System.out.println(cal1.before(cal2));
		
	}
}
