package ch3_operator;

public class OperatorEx16 {
	public static void main(String[] args) {
		float pi = 3.141592f;
		float shortPi = (int)(pi*1000) / 1000f;
		
		/*
		 * pi*1000 -> pi * (float)1000 -> 3141.592f;
		 * (int)3141.592f   -> 3141
		 * 3141/1000f -> (float)3141 / 1000f -> 3.141
		 */
		
		System.out.println(shortPi);
		
		// 반올림 소수 넷째자리에서 1
		shortPi = (int)(pi*1000+0.5)/1000f;
		System.out.println(shortPi);
		
		// 반올림 소수 넷째자리에서 2
		shortPi = Math.round(pi*1000) / 1000f;
		/*
		 * Math.round(3141.1592) / 1000f (= 1000.0f)
		 * 3142 / 1000f
		 * 3.142
		 */
		System.out.println(shortPi);
	}
}
