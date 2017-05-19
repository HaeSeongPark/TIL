package ch1_1;

import java.util.Arrays;
import java.util.Scanner;

/*
 * 사용자로부터 n개의 정수를 입력받는다.
 * 정수가 하나씩 입력될 때 마다 
 * 현재까지 입력된 정수들을 오름차순으로 정렬하여 출력
 */

public class Code15
{
	public static void main(String [] args)
	{
		Scanner s = new Scanner(System.in);
		int n = s.nextInt();
		int[] data = new int[n];
		
		for(int i=0; i<n; i++)
		{
			data[i] = s.nextInt();
			
			// 정렬
			for(int j=i; j>0; j--)
			{
				if(data[j-1] > data[j])
				{
					int tmp = data[j-1];
					data[j-1] = data[j];
					data[j] = tmp;
				}
			}
			//출력
			System.out.println(Arrays.toString(data));
//			for(int k=0; k<=i; k++)
//				System.out.print(data[k] + " ");
//			System.out.println();
			
		}
	}
}
