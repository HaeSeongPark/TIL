package ch3_Exercise;

public class Ch3_7 {
	public static void main(String[] args) {
		// 셋째자리에서 반올림 Math.round()쓰지 말고
		int fahrenheit = 100;
		float celcius = (int)((float)5 / 9 * (fahrenheit-32) * 100 + 0.5) / 100f;
//		float celcius = (int)(5f / 9 * (fahrenheit-32) * 100 + 0.5) / 100f;

		
//		
//		(float)5 / 9 * (fahrenheit-32) // 37.77778
//		(float)5 / 9 * (fahrenheit-32) * 100 // 3777.778
//		(float)5 / 9 * (fahrenheit-32) * 100 + 0.5 // 3778.278
//		(int)((float)5 / 9 * (fahrenheit-32) * 100 + 0.5)  // 3778
/*		(int)((float)5 / 9 * (fahrenheit-32) * 100 + 0.5) / 100f
	* 
*/
		
		
		System.out.println(fahrenheit);
		System.out.println(celcius);
	}
}
