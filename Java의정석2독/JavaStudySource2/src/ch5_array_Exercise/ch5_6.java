package ch5_array_Exercise;
/*
 * 거스름돈
 * 변수 oney의 금액을 동전으로 바꿨을 때 몇 개의 동전이 필요한지
 * 단, 가능한 적은 수의 동전을 거슬러 줘야 한다.
 * 나눗셈과 나머지연산
 */
public class ch5_6 {
	public static void main(String[] args) {
		int[] coinUnit = { 500, 100, 50, 10 };
		
		int money = 2680;
		System.out.println("money="+money);
		
		for(int i=0; i<coinUnit.length; i++){
			System.out.println(coinUnit[i]+"원: "+money/coinUnit[i]);
			money = money%coinUnit[i];
		}
	}
}
