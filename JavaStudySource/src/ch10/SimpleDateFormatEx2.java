package ch10;

import java.util.*;
import java.text.*;

public class SimpleDateFormatEx2 {
	public static void main(String[] args) {
		//Calendar와 Date간의 변환은 다음괕이 한다.
		Calendar cal = Calendar.getInstance();
		cal.set(2005, Calendar.OCTOBER, 3);
		
		Date day = cal.getTime();
		
		SimpleDateFormat sdf1, sdf2, sdf3, sdf4;
		sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		sdf2 = new SimpleDateFormat("yy-MM-dd E요일");
		sdf3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		sdf4 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a");
		
		System.out.println(sdf1.format(day));
		System.out.println(sdf2.format(day));
		System.out.println(sdf3.format(day));
		System.out.println(sdf4.format(day));
	}
}
/*
 * 2005-10-03
05-10-03 월요일
2005-10-03 15:07:32.175
2005-10-03 03:07:32 오후
 */