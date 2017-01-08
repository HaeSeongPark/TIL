package ch6;

public class RecursiveCallFactorial {
	public static void main(String[] args) {
		int result = factorial(4);
		
		System.out.println(result);
	}
	static int factorial(int n)
	{	//유효성검사 0보다 작으면 x / 12보다 크면 int의 유효범위를 지남
		if(n<=0 || n>12) return -1;
		
		if(n==1) return 1;

		return n*factorial(n-1);
	}
}
