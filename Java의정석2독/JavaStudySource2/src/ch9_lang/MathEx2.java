package ch9_lang;

import static java.lang.Math.*;

public class MathEx2 {
	public static void main(String[] args) {
		int i = Integer.MIN_VALUE;
		
		System.out.println("i = " + i);
		System.out.println("-i = " + (-i));
		
		try {
			System.out.printf("negateExact(%d) = %d%n ", 10, negateExact(10));
			System.out.printf("negateExact(%d) = %d%n ", -10, negateExact(-10));
			
			System.out.printf("negateExact(%d) = %d%n ", i, negateExact(i)); // 예외발생
		} catch (Exception e) {
			System.out.printf("negateExact(%d) = %d%n ", (long)i, negateExact((long)i));
		}
	}
}
