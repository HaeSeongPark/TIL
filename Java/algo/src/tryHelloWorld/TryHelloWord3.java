package tryHelloWorld;

import java.util.Arrays;

/*
 * Level 2 최소값 만들기
 * 
 * 자연수로 이루어진 길이가 같은 수열 A,B가 있습니다. 
 * 최솟값 만들기는 A, B에서 각각 한 개의 숫자를 뽑아 두 수를 곱한 값을 누적하여 더합니다. 
 * 이러한 과정을 수열의 길이만큼 반복하여 최종적으로 누적된 값이
 *  최소가 되도록 만드는 것이 목표입니다.

예를 들어 A = [1, 2] , B = [3, 4] 라면
1. A에서 1, B에서 4를 뽑아 곱하여 더합니다.
2. A에서 2, B에서 3을 뽑아 곱하여 더합니다.

수열의 길이만큼 반복하여 최솟값 10을 얻을 수 있으며, 이 10이 최솟값이 됩니다.
수열 A,B가 주어질 때, 최솟값을 반환해주는 getMinSum 함수를 완성하세요.
 */

class TryHelloWord3 {
	public int getMinSum(int[] A, int[] B) {
		int answer = 0;

		for (int i = 0; i < A.length - 1; i++) {
			boolean changed = false;
			for (int j = 0; j < A.length - 1 - i; j++) {
				if (A[j] > A[j + 1]) {
					int tmp = A[j];
					A[j] = A[j + 1];
					A[j + 1] = tmp;
					changed = true;
				}
			}
			if(changed == false) break;
		}
		
		for (int i = 0; i < B.length - 1; i++) {
			boolean changed = false;
			for (int j = 0; j < B.length - 1 - i; j++) {
				if (B[j] < B[j + 1]) {
					int tmp = B[j];
					B[j] = B[j + 1];
					B[j + 1] = tmp;
					changed = true;
				}
			}
			if(changed == false) break;
		}
		

		for (int i = 0; i < A.length; i++) {
			answer += A[i] * B[i];
		}

		return answer;
	}
	


	public static void main(String[] args) {
		TryHelloWord3 test = new TryHelloWord3();
		int[] A = { 1693, 5498, 8075, 7522, 3528, 7319, 5286, 6937, 8913, 1035 };
		int[] B = { 6079, 924, 1679, 2646, 3968, 5513, 8056, 5708, 5547, 1017 };
		System.out.println(test.getMinSum(A, B));
	}
}
