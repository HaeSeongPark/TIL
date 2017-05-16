package tryHelloWorld;
/*
 * 어떤 수 n(1<= n <=1,000,000)이 주어졌을 때, N의 다음 큰 수자는 다음과 같습니다.
 * N의 다음 큰 숫자는 N을 2진수로 바꾸었을 때의 1의 개수와 같은 개수로 이루어진 수
 * 1번째 조건을 만족하는 숫자들 중 N보다 큰 수 중에서 가장 작은 수를 찾아야 한다.
 * 예를 들면 78을 2진수로 바꾸면 1001110이며, 78의 다음 큰 숫자는
 * 83으로 진수수 1010011입니다.
 * 
 *      int postPattern = n & -n, smallPattern = ((n ^ (n + postPattern)) / postPattern) >> 2;
        return n + postPattern | smallPattern;
 */

public class NextBigNumber {
	static int nextBigNumber(int n){
		int countOne = Integer.bitCount(n);
		while( 1<=n && n<= 1_000_000){
			++n;
			if(countOne==Integer.bitCount(n))
			      return n;
		}
		return 0;
	}
	
	public static void main(String[] args) {
		int n = 78;
		System.out.println(nextBigNumber(n));
		System.out.println(Integer.toBinaryString(-n));
	}
}
