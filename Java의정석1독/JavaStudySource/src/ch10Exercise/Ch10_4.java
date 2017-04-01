package ch10Exercise;

import java.text.*;
import java.util.*;

public class Ch10_4 {

	public static void main(String[] args) {
		String pattern = "yyyy/MM/dd";
		String pattern2 = "입력하신 날짜는 E요일입니다.";
		DateFormat df = new SimpleDateFormat(pattern);
		DateFormat df2 = new SimpleDateFormat(pattern2);
		Scanner s = new Scanner(System.in);
		
		Date inDate = null;
		
		do{
			System.out.println("날짜를 "+pattern+"의 형태로 입력해주세요.(입력예:2007/05/11)");
			
			System.out.print(">>");
			try {
				inDate = df.parse(s.nextLine());
				break;
			} catch (ParseException e) {}
		}while(true);
		
		System.out.println(df2.format(inDate));
	}

}
