package ch10;

import java.time.*;
import java.time.format.*;

public class DateFormatterEx1 {
	public static void main(String[] args) {
		ZonedDateTime zdateTime = ZonedDateTime.now();
		
		String[] patternArr = {
			"yyyy-MM-dd HH:mm:ss",
			"''yy년 MMM dd일 E요일",
			"yyyy-MM-dd HH:mm:ss.SSS z VV",
			"yyyy-MM-dd hh:mm:ss a",
			"오늘은 올 해의 D번째 날입니다.",
			"오늘은 이 달의 d번째 날입니다.",
			"오늘은 올 해의 w번째 주입니다.",
			"오늘은 이 달의 W번째 주입니다.",
			"오늘은 이 달의 W번째 E요일입니다."
		};
		for(String p : patternArr){
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern(p);
			System.out.println(zdateTime.format(formatter));
		}
	}
	/*
	 * 2017-01-27 22:36:46
		'17년 1월 27일 금요일
		2017-01-27 22:36:46.915 KST Asia/Seoul
		2017-01-27 10:36:46 오후
		오늘은 올 해의 27번째 날입니다.
		오늘은 이 달의 27번째 날입니다.
		오늘은 올 해의 4번째 주입니다.
		오늘은 이 달의 4번째 주입니다.
		오늘은 이 달의 4번째 금요일입니다.

	 */
}
