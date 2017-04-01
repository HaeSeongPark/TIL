package ch3_operator_Excercise;
/*
 * numㅂ보다 크면서도 가장 가까운 10의 배수에서
 * 변수 num의 값을 뺀 값을 구하는 코드
 * ex) 24의 크면서도 가장 가까운 10의 배수는 30이다.
 * 30에서 24를 빼면 6
 */
public class ch3_6 {
	public static void main(String[] args) {
		int num = 81;
		//일단 num의 값보다 크면서도 가장 가까운 10의 배수
		int tmp = (num / 10 +1) * 10;
		System.out.println(tmp-num);
		
		
		//hint에 나머지연산자 사용하라고...
		//그냥 10에서 num의 1의자리수를 빼면 되는 거였네...
		//3독에서는 맞추길...
		System.out.println(10 - num%10);
	}
}
