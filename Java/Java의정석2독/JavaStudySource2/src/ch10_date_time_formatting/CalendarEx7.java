package ch10_date_time_formatting;

import java.util.Calendar;
import java.util.Scanner;

public class CalendarEx7 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		int month = 0;
		int year = 0;
		
		while(true){
			System.out.println("입력해주세요. 양식: 년 월, 예) 2017 4 (종료:q)");
			String inputLine = scanner.nextLine();
			String[] inputArr = inputLine.trim().split(" +");
			
			if(inputArr[0].equalsIgnoreCase("q"))
				System.exit(0);
			else if ( inputArr.length != 2){
				System.out.print("양식이 틀렸습니다.  ");
				continue;
			}
			
			year = Integer.parseInt(inputArr[0]);
			month = Integer.parseInt(inputArr[1]);
			
			Calendar sDay = Calendar.getInstance();
			Calendar eDay = Calendar.getInstance();
			
			sDay.set(year, month-1, 1);
			eDay.set(year, month-1, sDay.getActualMaximum(Calendar.DATE));
			
			sDay.add(Calendar.DATE, -sDay.get(Calendar.DAY_OF_WEEK)+1);
			eDay.add(Calendar.DATE, 7-eDay.get(Calendar.DAY_OF_WEEK));
			
			System.out.println("     " + year + "년 " + month + "월");
			System.out.println(" SU MO TU WE TH FR SA");
			
			for(int n=1; sDay.before(eDay)|| sDay.equals(eDay); sDay.add(Calendar.DATE, 1)){
				int day = sDay.get(Calendar.DATE);
				System.out.print( day<10 ? "  "+day : " "+day );
				if(n++%7==0) System.out.println();
			}
		}
	}
}
