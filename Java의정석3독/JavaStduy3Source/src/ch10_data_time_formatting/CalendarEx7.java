package ch10_data_time_formatting;

import java.util.*;

public class CalendarEx7 {
	public static void main(String[] args) {
		System.out.println("년 월 입력");
		Scanner scanner = new Scanner(System.in);
		String input = scanner.nextLine().trim();
		String[] yearMonth = input.split(" +");
		int year = Integer.parseInt(yearMonth[0]);
		int month = Integer.parseInt(yearMonth[1]);
		
		Calendar sDay = Calendar.getInstance();
		Calendar dDay = Calendar.getInstance();
		
		sDay.set(year, month-1, 1);
		sDay.add(Calendar.DATE, -sDay.get(Calendar.DAY_OF_WEEK)+1);
		dDay.set(year, month, 1);
		dDay.add(Calendar.DATE, -1);
		dDay.add(Calendar.DATE, 7-dDay.get(Calendar.DAY_OF_WEEK));
		
		System.out.println("     " + year+"년"+month+"월");
		System.out.println(" SU MO TU WE TH FI SA");
		
		for(int i=1; sDay.before(dDay)|| sDay.equals(dDay); i++, sDay.add(Calendar.DATE, 1)){
			int day = sDay.get(Calendar.DATE);
			System.out.print(day<10 ? "  "+day : " "+day);
			if(i%7==0) System.out.println();
		}
	}
}
