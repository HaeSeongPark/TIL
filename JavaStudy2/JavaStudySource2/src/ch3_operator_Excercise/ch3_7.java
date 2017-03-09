package ch3_operator_Excercise;

/*
 * 화씨를 섭씨를 변환
 * C = 5/9 * (F-32)
 * 소수점 셋쨰자리에서 반올림
 * Math.round()를 사용하지 않고
 */

public class ch3_7 {
	public static void main(String[] args) {
		int fahrenheit = 100;
		float celcius = (float)5/9 * (fahrenheit - 32);
		
		// 3777.778  + 0.5
		// 3778.278
		float ceciusRound = (int)(celcius * 100 +0.5f) / 100f;
		
//		float celciusRound = (celcius * 100 +0.5)/100;
		
		System.out.println("Fahrenhit:"+fahrenheit);
		System.out.println("Celcius:"+ceciusRound);
		
	}
}
