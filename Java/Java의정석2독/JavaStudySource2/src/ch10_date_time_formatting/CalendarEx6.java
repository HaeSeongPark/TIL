package ch10_date_time_formatting;

import java.util.Calendar;
import java.util.Scanner;

public class CalendarEx6 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String[] argArr = null;
		int year, month;
		
		while(true){
			System.out.print("년도와 월을 입력해주세요. (종료:q)");
			
			String input = scanner.nextLine().trim();
			argArr = input.split(" +");
			
			String content = argArr[0].trim();
			
			if(content.equalsIgnoreCase("q"))
				System.exit(0);
			else{
				year = Integer.parseInt(argArr[0]);
				month = Integer.parseInt(argArr[1]);
				
				int START_DAY_OF_WEEK = 0;
				int END_DAY = 0;
				
				Calendar sDay = Calendar.getInstance();
				
				// 월의 경우 0부터 11까지의 값을 가지므로 1을 빼주어야 한다.
				// 예를 들어, 2004년 11월 1일은 sDay.set(2004,10,1);과 같이 해야 한다.
				sDay.set(year, month-1,1);
				

				
				// 첫 번째 요일이 무슨 요일인지 알아낸다.
				START_DAY_OF_WEEK = sDay.get(Calendar.DAY_OF_WEEK);
				// eDay에 지정된 날짜를 얻어온다.
				END_DAY = sDay.getActualMaximum(Calendar.DATE);
				
				System.out.println("     " + year + "년 " + month + "월");
				System.out.println(" SU MO TU WE TH FR SA");
				
				// 해당 월의 1일이 어느 요일인지에 따라서 공백을 출력
				// 만일 1일이 수요일이라면 공백을 세번 찍는다.(일요일부터 시작)
				for(int i=1; i<START_DAY_OF_WEEK;i++){
					System.out.print("   ");
				}
				for(int i=1, n=START_DAY_OF_WEEK; i<=END_DAY; i++,n++){
					System.out.print((i<10) ? "  "+i : " "+i);
					if(n%7==0) System.out.println();
				}
				System.out.println();
			}
		}
	}
}
