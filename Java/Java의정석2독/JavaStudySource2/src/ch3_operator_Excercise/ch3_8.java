package ch3_operator_Excercise;

/*
 * 문제점을 수정해서 실행결과와 같은 결과를 얻도록 하시오.
 */

public class ch3_8 {
	public static void main(String[] args) {
		byte a = 10;
		byte b = 20;
		// byte c = a + b;
		// 'a+b' 는 'byte+byte'이므로 'int+int'로 형변환되서 계산됨
		// 결과가 int형인데 int형보다 범위가 작은 byte넣을려니까 에러남
		// 아래와 같이 해야됨 byte의 범위(-128~127)를 벗어나면 값 손실 있음
		byte c = (byte)(a+b);
		
		char ch = 'A';
//		ch = ch +2;
		// char + int -> int + int -> int
		// 명시적 형변환 필요
		ch = (char)(ch+2);
				
//		float f = 3 / 2; // int/int라서 소수점 이아임 어느 한쪽 float로 해야함.
		float f = 3f / 2;
		
//		long l = 3000 * 3000 * 3000; // int연산인데 int의 범위를 넘어가서 쓰레기값들어감 어느 하나 long으로 해야함
		long l = 3000 * 3000 * 3000L;
		

		float f2 = 0.1f;
		double d = 0.1;

		// boolean result = d==f2; // double과 float간의 비교는 dobule을 float로 바꿔서 해야 됨.
		boolean result = (float)d==f2;
		
		System.out.println("c="+c);
		System.out.println("ch="+ch);
		System.out.println("f="+f);
		System.out.println("l="+l);
		System.out.println("result="+result);
	}
}
