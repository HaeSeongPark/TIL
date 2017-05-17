package ch1_1;

import java.util.Scanner;

/*
 * 개수 n을 입력받음
 * n개의 정수를 입력받아 순서대로 배열에 저장
 * 중복된 정수 쌍의 개수를 카운트하여 출력
 * 예를 들어 n=6이고 2,4,2,4,5,2이면 중복된 정수쌍은
 * (2,2) (2,2), (2,2) (4,4) 4쌍이다.
 * 
 */
public class Code11
{
	public static void main(String [] args)
	{
		Scanner s = new Scanner(System.in);
		int n = s.nextInt();
		int[] data = new int[n];
		for(int i=0; i<n; i++)
		{
			data[i] = s.nextInt();
		}
		
		s.close();
		
		// index 0 -> 1부터 n까지 비교
		// index 1 -> 2부터 n까지 비교
		// n-1까지 하면서 같으면 count++;
		
		int count = 0;
		for(int i=0; i<n-1; i++)
		{
			for(int j=i+1; j<n; j++)
			{
				if(data[i]==data[j])
					count++;
			}
		}
		
		System.out.println(count);
	}
}
