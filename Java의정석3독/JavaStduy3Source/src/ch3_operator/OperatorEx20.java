package ch3_operator;

public class OperatorEx20 {
	public static void main(String[] args) {
		System.out.println(-10%8);
		System.out.println(10%-8);
		System.out.println(-10%-8);
		
		/*
		 * 나머지 연산자는 나누는 수로 음수도 허용
		 * 그러나 부호는 무시되므로 결과는 음수의 절대값으로 나눈 나머지와 같다.
		 * 피연산자의 부호를 모두 무시하고, 나머지 연산을
		 *  한 결과에 왼쪽 피연산자의 부호를 붙이면된다
		 */
	}
}
