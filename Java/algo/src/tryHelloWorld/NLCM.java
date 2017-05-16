package tryHelloWorld;


public class NLCM {
	public long nlcm(int[] num) {
		
		long num1 = num[0];
		long num2 = 0;
		long num3 = 0;
		for(int i=1; i<num.length; i++){
			num2 = num[i];
			num3 = lcm(num1,num2);
			num1 = num3;
		}
		return num3;
	}
	
	static long gcd(long a, long b) {
		if (b == 0) return a;
		return gcd(b, a % b);
	}

	static long lcm(long a, long b) {
		return a * b / gcd(a, b);
	}

	public static void main(String[] args) {
		NLCM c = new NLCM();
		int[] ex = { 21, 93, 29, 23, 97, 99, 99, 59, 5, 69 };
		// 아래는 테스트로 출력해 보기 위한 코드입니다.
		System.out.println(c.nlcm(ex));
	}
}