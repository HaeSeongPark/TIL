package ch1_1;

import java.util.Scanner;

/*
 * 사용자로부터 하나의 양의 정수 n을 입력받고
 * 이어서 n개의 정수가 입력된다.
 * 그런 다음 다시 하나의 정수 K가 입력된다.
 * 
 * n개의 정수들 중에서 2개의 정수를 선택해 그 합이  K가 되는 경우의 수를 카운트
 * 5
 * 1 2 3 4 5 
 * 3
 * 
 * 같은 정수 중복 선택 X  
 * 모든 쌍을 다 구해야 하나?
 * 
 */

public class Task10
{
	public static void main(String [] args)
	{
		Scanner s = new Scanner(System.in);
//		사용자로부터 하나의 양의 정수 n을 입력받고
		int n = s.nextInt();
		int[] data = new int[n];
//		 이어서 n개의 정수가 입력된다.
		for(int i=0; i<n; i++)
			data[i] = s.nextInt();
//		 그런 다음 다시 하나의 정수 K가 입력된다.
		int k = s.nextInt();
		
		int count = 0;
		
		for(int i=0; i<n-1; i++)
		{
			for(int j=i; j<n-1-i; j++)
			{
				if((data[j]+data[j+1]) == k)
					count++;
					
			}
		}
		
		System.out.println("count " + count);

	}
}
