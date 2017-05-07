package ch4_Exercise;
/*
 * 회문수를 구하는 프로그램
 * 회문수 : 숫자를 거꾸로 읽어도 앞으로 읽는 것과 같은 수
 * 예 '12321' 이나 '13531'
 * 힌트 : 나머지 연산자 이용
 */
public class ch4_15 {
	public static void main(String[] args) {
		int number = 12321;
		int tmp = number;
		
		int result = 0;
		
		while(tmp!=0){
//			result*=10;
//			result += tmp % 10;
			result = result *10 + tmp%10;
			tmp /= 10;
		}
		System.out.println(result);
		if(number == result)
			System.out.println( number + "는 회문수 입니다.");
		else
			System.out.println( number + "는 회문사가 아닙니다.");
	}
}
