package ch6_oop1;

public class PowerTest {
	public static void main(String[] args) {
		int x = 2;
		int n = 5;
		long result = 0;
		
		// 재귀함수
		for(int i=1; i<=n; i++){
			result += power(x,i);
		}
		System.out.println(result);
		
		// Math.pow만 이용
		result = 0;
		for(int i=1; i<=n; i++){
			result += Math.pow(x, i);
		}
		System.out.println(result);
		
		
		// for문2개 이용
		result = 0;
		int tmp = 1;
		for(int i=1; i<=n; i++){
			tmp = 1;
			for(int j=1; j<=i; j++){
				tmp*=x;
			}
			result+=tmp;
		}
		System.out.println(result);
	}
	static long power(int x, int n){
		if(n==1) return x;
		return x * power(x, n-1);
	}
}
