package ch4_Exercise;
/*
 * int타입의 변수 num이 있을 때, 각 자리의 합을 더한 결과를 출력하는 코드를 완성
 * 만일 변수 num의 값이 12345라면, '1+2+3+4+5'의 결과인 15를 출력
 * 문자열로 변환 x 숫자로만
 */
public class ch4_10 {
	public static void main(String[] args) {
		int num = 12345;
		int sum = 0;
		
		while(num>0){
			sum+=num%10;
			num/=10;
		}
		System.out.println("sum="+sum);
	}
}
