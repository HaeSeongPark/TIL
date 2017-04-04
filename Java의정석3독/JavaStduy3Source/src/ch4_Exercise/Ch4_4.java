package ch4_Exercise;

public class Ch4_4 {
	public static void main(String[] args) {
		
		int sum = 0;
		int cnt = 1;
		int sign =1;
		
		while( (sum += cnt * sign ) < 100){
			cnt++;
			sign *= -1;
		}
		
//		for(int i=1; sum<1--; i++, s=-s){
//			num = i * s;
//			sum += num
//		}
		
		System.out.println(cnt);
	}
}
