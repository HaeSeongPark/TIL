package ch10_date_time_formatting;

public class CalendarEx8 {
	public static void main(String[] args) {
		String date1 = "201508";
		String date2 = "201405";
		
		// 년과 월 정도의 계산이라면, 
		// 굳이 Calendar를 사용하지 않고 이처럼 간단히 처리해도 좋다.
		// 년과 월을 substring으로 잘라서 정수로 변환한다.
		// 년에 12를 곱해서 월로 변환한 다음에 뺄셈을 하면 개월차를 구할 수 있다.
		int month = Integer.parseInt(date1.substring(0, 4))*12
				+ Integer.parseInt(date1.substring(4));
		int month2 = Integer.parseInt(date2.substring(0, 4))*12
				+ Integer.parseInt(date2.substring(4));
		
		System.out.printf("%s와 %s의 차이는  %d개월 입니다.",date1,date2,Math.abs(month-month2));
	}
}
