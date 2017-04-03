package ch3_Exercise;

public class Ch3_6 {
	public static void main(String[] args) {
		// num 보다 크고 가장 가까운 10의 배수에서 변수 num의 값을 뺀 나머지를 구하는 코드
		// 24-> 30 -24 6
		// 19-> 20 - 19 1
		// 81 -> 90 -81 9
		int num = 24;
		System.out.println( 10 - num%10);
	}
}
