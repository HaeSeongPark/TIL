package ch2_variable;

public class ch2Exercise2_9 {

	public static void main(String[] args) {
		byte b = 10;
		char ch = 'A';
		int i = 100;
		long l = 1000L;
		
		/*
		 * a. b = (byte)i;  int -> byte : 큰 거에서 작은거로형변환하려면 명식적으로적어줘야함
		 * b. ch = (char)b; byte -> char : 작 -> 큰 이지만 byte -128~127, char 0~645535이므로 다르다 따라서 명시적
		 * c. short s = (short)ch; char -> short : 2byte로 같지지만 char0~65535이고 short는 -32,768~32767으로 다르다 따라서 명시적으로
		 * d. float f = (float)l;  long -> float : long(8byte) float(4byte)이지만 범위는 float가 더 커서 생략 가능.
		 * e. i = (int)ch;  char -> int : 생략가능
		 * 
		 * d.e

		 *
		 *11. a,b,c,f
		 *12. abce
		 */
	}

}
