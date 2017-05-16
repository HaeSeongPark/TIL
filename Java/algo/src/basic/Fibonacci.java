package basic;

public class Fibonacci {
//	for문 변수
//	public long fibonacci(int num) {
//		long answer = 0;
//		long indexSecond = 0;
//		long indexFirst = 1;
//		for(int i=2; i<=num; i++){
//			answer = indexFirst + indexSecond;
//			indexSecond = indexFirst;
//			indexFirst = answer;
//		}
//		return answer;
//	}
	
//	for문 배열
	public long fibonacci(int num) {
		long answer = 0;
		long[] fiboArray = new long[num+1];
		fiboArray[0] = 0;
		fiboArray[1] = 1;
		
		for(int i=2; i<=num; i++){
			fiboArray[i] =fiboArray[i-2] + fiboArray[i-1];
		}
		answer = fiboArray[num];
		return answer;
	}
	
//	//재귀함수
//	public long fibonacci(int num) {
//		if(num == 1 || num == 2)
//			return 1;
//		else{
//			return fibonacci(num-1) + fibonacci(num-2);
//		}
//	}

  // 아래는 테스트로 출력해 보기 위한 코드입니다.
	public static void main(String[] args) {
		Fibonacci c = new Fibonacci();
		int testCase = 5;
		System.out.println(c.fibonacci(testCase));
	}
}