package ch5_Exercise;

public class Ch5_6 {
	public static void main(String[] args) {
		int[] coinUnit = {500, 100, 50, 10};
		
		int money = 2680;
		System.out.println(money);
		
		for(int i=0; i<coinUnit.length; i++){
			
			System.out.printf("%d¿ø : %d%n",coinUnit[i],money/coinUnit[i]);
			money %= coinUnit[i];
		}
	}
}
