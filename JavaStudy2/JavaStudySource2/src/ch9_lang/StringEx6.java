package ch9_lang;

public class StringEx6 {
	public static void main(String[] args) {
		int iVal = 100;
		String strVal = String.valueOf(iVal);
		
		double dVal = 200.0;
		String strVal2 = dVal+ "";
		
		// 문자열 앞뒤 공백 제고 trim() 습관적으로 해주는 것이 중요 문자열 앞뒤 공백이 있을 때 변환하면 예외발생
		// NumberFormatException
		// '+'나 '.' , 'f' 는 허용
		double sum = Integer.parseInt("+"+strVal.trim()) + Double.parseDouble(strVal2);
		double sum2 = Integer.valueOf(strVal) + Double.valueOf(strVal2);
		
		System.out.println(String.join("", strVal, "+", strVal2, "=") + sum);
		System.out.println(strVal + "+" + strVal2 + "=" + sum2);
	}
}
