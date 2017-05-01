package ch10_data_time_formatting;

public class CalendarEx9 {
	public static void main(String[] args) {
		
		System.out.println("2014.5.31 : "+getDayOfWeek(2014,5,31));
		System.out.println("2012.6. 1 : "+getDayOfWeek(2012,6,1));
		System.out.println("2014. 5. 1 - 2014.4.28 :"+dayDiff(2014,5,1,2014,4,28));
		System.out.println("2015. 6. 29 : "+ convertDateToDay(2015,6,29));
		System.out.println("735778 : "+ convertDayToDate(735778));
		
	}
	public static int[] endOfMonth = {31, 28, 31, 30, 31, 30 , 31, 31, 30 ,31, 30, 31};
	
	public static boolean isLeapYear(int year){
		return ((year%4==0)&&(year%100!=0)||(year%400==0));
	}
	public static int dayDiff(int y1, int m1, int d1, int y2, int m2, int d2){
		return convertDateToDay(y1,m1,d1) - convertDateToDay(y2,m2,d2);
	}
	public static int getDayOfWeek(int year, int month, int day){
		//1~7의 값을 반호나한다. 결과가 1이면 일요일이다.
		return convertDateToDay(year, month, day)%7 + 1;
	}
	
	public static int convertDateToDay(int year, int month, int day){
		int totalYearDays = 0;
		int totalMonthDays = 0;
		
		for(int i=1; i<=year-1; i++){
			totalYearDays += (isLeapYear(i) ? 366 : 365);
		}
		
		for(int i=0; i<month-1; i++){
			totalMonthDays += endOfMonth[i];
		}
		
		if(isLeapYear(year) && month>2){
			totalMonthDays++;
		}
		
		return totalYearDays + totalMonthDays + day;
	}
	
	public static String convertDayToDate(int day){
		
		int yearNum = 0;
		int year = 1;
		while(day>yearNum){
			yearNum = isLeapYear(year) ? 366 : 365;
			day -= yearNum;
			year++;
			
		}
		
		int month = 0;
		int monthNum = endOfMonth[month];
		while(day > monthNum){
			day -= monthNum;
			monthNum = endOfMonth[++month];
			if(isLeapYear(year)&&month==1) monthNum++;
		}
		
		
		return year + "-" + (month+1) + "-" + day;
	}
}
