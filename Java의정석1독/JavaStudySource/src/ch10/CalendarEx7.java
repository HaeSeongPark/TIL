package ch10;

import java.util.Calendar;
import java.util.Scanner;

public class CalendarEx7 {
	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		String[] argArr =null;
		int year, month;
		
		while(true){
			System.out.print("년도와 월을 입력해주세요 : (종료:q)");
			
			String input = scanner.nextLine();
			input = input.trim();
			argArr = input.split(" +");
			
			String content = argArr[0].trim();
			
			if(content.equalsIgnoreCase("q"))
				System.exit(0);
			else{
				year = Integer.parseInt(argArr[0]);
				month = Integer.parseInt(argArr[1]);
				
				int START_DAY_OF_WEEK = 0;
				int END_DAY = 0;
				
				Calendar sDay = Calendar.getInstance(); //시작일
				Calendar eDay = Calendar.getInstance(); //끝일
				
				//월의 경우 0부터 11까지의 값을 가지므로 1을 빼주어야 한다.
				// 예를 들어, 2004년 11월 1일은 sDay.set(2004,10,1);과 같이 해야 한다.
				sDay.set(year, month-1,1); //입력월의 1월로 설정
				
				//getActualMaximum(Calendar.DATE) 해당월의 마지막날
				eDay.set(year, month-1,sDay.getActualMaximum(Calendar.DATE)); // 입력월의 말일로 설정
				
				//1일이 속한 주의 일요일로 날짜설정.
				sDay.add(Calendar.DATE, -sDay.get(Calendar.DAY_OF_WEEK)+1);

				//말일이 속한 주의 토요일로 날짜설정
				eDay.add(Calendar.DATE, 7 - eDay.get(Calendar.DAY_OF_WEEK));
				
				System.out.println("     " + year + "년 " + month + "월");
				System.out.println(" SU MO TU WE TH FR SA");

				//시작 일부터 마지막 일까지(sDay<=eDay) 1ㅇㄹ씩 증가시키면서 일(Calendar.Date)을 출력
				for(int n=1; sDay.before(eDay) || sDay.equals(eDay); sDay.add(Calendar.DATE,1)){
					int day = sDay.get(Calendar.DATE);
					System.out.print((day<10)?"  "+day: " "+day);
					if(n++%7==0)System.out.println();
				}
			}
				
		}
	}
}
