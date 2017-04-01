package ch9;

import java.util.Date;

public class ToStringTest {
	public static void main(String[] args) {
		String str = new String("KOREA");
		Date today = new Date();
		
		System.out.println(str);
		System.out.println(str.toString());
		System.out.println(today);
		System.out.println(today.toString());
	}
}
