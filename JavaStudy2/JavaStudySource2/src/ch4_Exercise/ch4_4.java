package ch4_Exercise;

/*
 * 1+(-2)+3+(-4)+...과 같은 식으로 계속 더해나갔을 때, 몇까지 더해야 총합이 100이상이 되는지 구하시오.
 */

public class ch4_4 {
	public static void main(String[] args) {
		int sum = 0; // 총합
		int num = 0;
		for(int i=1; sum < 100; i++){
			if(i%2!=0)  // 홀수 일 때
				sum+=i;
			else       // 짝수 일 때
				sum+=-i; 
			
			num = i;
		}
		System.out.println(num+" 까지 더해야 총합이 100이상"+sum);
		
		sum = 0;
		int s = 1; // 부호
		num = 0;
		
		for(int i=1;sum<100; i++, s=-s){
			num = s * i;
			sum += num;
		}
		System.out.println(num+" "+sum);
	}
}
