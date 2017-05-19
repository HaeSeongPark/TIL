package ch1_1;

import java.util.Arrays;
import java.util.Scanner;

/*
 * 사용자로부터 n개의 정수를 입력받는다.
 * 정수가 하나씩 입력될 때 마다 
 * 현재까지 입력된 정수들을 오름차순으로 정렬하여 출력
 * 교수님 답
 */

public class Code15_2
{
	public static void main(String [] args)
	{
		Scanner s = new Scanner(System.in);
		int n = s.nextInt();
		int[] data = new int[n];
		
		// i는 입력받는 길이 라서 1부터 n
		for(int i=1; i<=n; i++)
		{
			int input = s.nextInt();
			
			// 뒤에서 부터 비교 
			// 맨 뒤 index는 길이-1이기 때문에
			int j = i-1;
			
			// 입력값과 index 0 까지 비교하면서 input값보다 작은 것 찾기
			// 그러니까 j가 0보다 크거나 같으면서 data[j] > tmp을 때 돌다가 끝나면
			// 작은 걸 찾은거거나  0까지 찾았는데 없는 것(input보다 작은 게 없다)
			while(j>=0 && data[j] > input)
			{
				// input보다 크면 한 칸씩 뒤로 밀기
				data[j+1] = data[j];
				j--;
			}
			// 
			data[j] = input;
			
			//출력
			System.out.println(Arrays.toString(data));
//			for(int k=0; k<=i; k++)
//				System.out.print(data[k] + " ");
//			System.out.println();
			
		}
	}
}
