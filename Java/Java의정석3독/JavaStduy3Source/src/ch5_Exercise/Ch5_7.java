package ch5_Exercise;

public class Ch5_7 {
	public static void main(String[] args) {
		if(args.length!=1){
			System.out.println("UUSAGE: java Exercise5_7 3120");
			System.exit(0);
		}
		
		int money = Integer.parseInt(args[0]);
		
		System.out.println(money);
		
		int[] coinUnit = {500, 100, 50, 10 };
		int[] coin = {5, 5, 5, 5};
		
		for(int i=0; i<coinUnit.length;i++){
			int coinNum = 0;
			// 금액을 동전단위로 나눠서 필요한 동전의 개수를 구한다.
			coinNum = money / coinUnit[i];
			
			// 배열  coint에서 coinNum만큼의 동전을 뺀다
			if(coin[i] >= coinNum) coin[i] -= coinNum;
			else {
				coinNum = coin[i];
				coin[i] = 0;
			}
			
			// 금액에서 동전의 개수(coninNum)와 동전단위를 곱한 값을 뺀다.
			money -= coinUnit[i] * coinNum;
		}
		if(money>0){
			System.out.println("거스름론이 부족하빈다.");
			System.exit(0);
		}
		System.out.println("남은 동전의 개수");
		for(int i=0; i<coinUnit.length; i++){
			System.out.println(coinUnit[i] + "원:"+coin[i]);
		}
	}
}
