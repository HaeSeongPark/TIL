package ch10_date_time_formatting;

import java.util.Calendar;

public class CalendarEx2 {
	public static void main(String[] args) {
		final String[] DAY_OF_WEEK = { "", "일", "월", "화", "수", "목", "금", "토" };
		
		Calendar date1 = Calendar.getInstance();
		Calendar date2 = Calendar.getInstance();
		
		//month는 0부터 시작   0 : 1월
		// date1.set(2015, 7, 15); 7 -> 8월
		date1.set(2015, Calendar.AUGUST, 15);
		
		System.out.println("date1은 " + toString(date1) 
									 + DAY_OF_WEEK[date1.get(Calendar.DAY_OF_WEEK)]
									 + "요일이고, ");
		
		System.out.println("오늘(date2)은 "+toString(date2)
		+DAY_OF_WEEK[date2.get(Calendar.DAY_OF_WEEK)]+"요일입니다.,");
		
		// 두 날짜간의 차이를 얻으려면, getTimeInMillis() 천분의 일초 단위로 변환해야 한다.
		long difference = (date2.getTimeInMillis() - date1.getTimeInMillis()) / 1000;
		
		System.out.println("그 날(date1)부터 지금 (date2) 까지 "+difference +"초가 지났습니다.");

		System.out.println("일(day)로 계산하면 " + difference/(24*60*60)+"일입니다.");
		
	}
	public static String toString(Calendar date){
		return date.get(Calendar.YEAR) + "년" + (date.get(Calendar.MONTH)+1)
				+ "월" + date.get(Calendar.DATE) + "일";
	}
	
	/*
	 *  date1은 2015년8월15일토요일이고, 
		오늘(date2)은 2017년4월13일목요일입니다.,
		그 날(date1)부터 지금 (date2) 까지 52444800초가 지났습니다.
		일(day)로 계산하면 607일입니다.
		
		시간상의 전후를 알고 싶을 때는 두 날짜간의 차이가 양수인지 음수인지 판단하거나
		boolean after(Object when) , boolean before(Object when)을 사용
	 */
}
