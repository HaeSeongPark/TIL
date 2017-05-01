package ch10_data_time_formatting;

public class calendarEx8 {
	public static void main(String[] args) {
		String date1 = "201508";
		String date2 = "201405";
		
		int month1 = Integer.parseInt(date1.substring(0, 4)) * 12 +
					 Integer.parseInt(date1.substring(4));
		int month2 = Integer.parseInt(date2.substring(0, 4)) * 12 +
				 Integer.parseInt(date2.substring(4));
		System.out.println("Â÷ÀÌ"+Math.abs(month2-month1));
	}
}
