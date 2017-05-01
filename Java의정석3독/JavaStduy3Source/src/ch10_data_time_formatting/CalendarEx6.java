package ch10_data_time_formatting;

import java.util.*;

public class CalendarEx6 {
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
		dDay.set(year, month, 1);
		dDay.add(Calendar.DATE, -1);
		
		int startDay = sDay.get(Calendar.DATE);
		int endDay = dDay.get(Calendar.DATE);
		
		System.out.println("     " + year+"년"+month+"월");
		System.out.println(" SU MO TU WE TH FI SA");
		
		for(int i=1; i<startDay; i++){
			System.out.print("  ");
		}
		
		for(int i=1, n=startDay; i<=endDay;i++, n++  ){
			System.out.print(i<10? "  "+i : " "+i);
			if(n%7==0) System.out.println();
		}
	}
}
