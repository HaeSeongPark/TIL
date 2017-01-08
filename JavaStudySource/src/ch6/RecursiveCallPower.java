package ch6;

public class RecursiveCallPower {
	static long power(int x, int n) {
		long result = 0;

		if (n == 1)
			result = x;
		else if (x == 0 && n == 0)
			result = -1;
		else if (n == 0)
			result = 1;
		else if (x == 0)
			result = 0;
		else
			result = x * power(x, n - 1);

		return result;
	}

	public static void main(String[] args) {
		int x = 0, n = 0;
		long result = 0;
		// for (int i = 1; i <= n; i++) {
		// result += power(x, i);
		// }
		result = power(x, n);
		if (result == -1)
			System.out.println("정의 할 수 없는 수입니다.");
		else
			System.out.println(power(x, n));
	}

}
