package basic;
/*
 * 소수 찾기
 * 소수는 1과 자기 자신으로만 나누어지는 수를 의미
 * 1은 소수가 아닙니다.
 * 10을 입력받았다면, 1부터 10사이의 소수는 [2,3,5,7] 4개가 존재하므로 4를 반환
 * 5를 입력받았다면, 1부터 5사이의 소수는 [2,3,5]3개가 존재하므로 3을 반환
 * 
 */

import java.util.ArrayList;
import java.util.Arrays;

public class NumOfPrime {
	int numberOfPrime(int n) {
		int result = 0;
//		int checkCnt=0;
//		for(int i=2; i<=n; i++){
//			for(int j=1; j<=i; j++)
//				if(i%j==0) checkCnt++;
//			if(checkCnt==2) result++;
//			checkCnt=0;
//		}  4956... 4초...
//		--------------------------------------------
//		for(int i=2; i<=n; i++){
//			boolean check = true;
//			for(int j=2; j<i; j++){
//				if(i%j==0) {
//					check = false;
//					break;
//				}
//			}
//			if(check==true)
//				result++;
//		}  // 442 0.4초
//		
//		return result;
		
//	    입력받은 수보다 작은 수의 소수들만 나누어보면 되는 것   // 83, 0.083초
		ArrayList<Integer> prime = new ArrayList<>();
		prime.add(2);
		for(int i=2; i<=n; i++)
		{
			for(int j=0, primeSize = prime.size(); j < primeSize; j++ ){
//				for(int i =0, length = array.length; i < length; i++){} // for문에 가급적 함수 nono 선언시 위처럼초기화후 사용
				 
				if(i%prime.get(j)==0) break; // 소수가 아닌경우
				
				if(j+1==prime.size()) // 소수일 때
					prime.add(i);
			}
		}
		System.out.println(prime);
		return prime.size();
		
//		// 에라토스테네스의 체알고리즘 int배열사용 2, 0.002초
//		int[] arr = new int[n+1];
//
//		for(int i=2; i<=n;i++){
//			arr[i]=i;
//		}
//		for(int i=2; i*i<=n; i++){
//			if(arr[i]==0) continue;
//			for(int j=i+i; j<=n; j+=i){
//				arr[j] = 0;
//			}
//		}
//		for(int i=2; i<=n; i++){
//			if(arr[i]!=0)
//				result++;
//		}
//		return result++;
	}
	public static void main(String[] args) {
		NumOfPrime prime = new NumOfPrime();
		long start = System.currentTimeMillis();
		System.out.println( prime.numberOfPrime(6) );
		long end = System.currentTimeMillis();
		System.out.println(end-start);

	}
}