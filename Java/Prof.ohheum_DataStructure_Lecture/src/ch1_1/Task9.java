package ch1_1;

import java.util.Arrays;
import java.util.Scanner;

/*
 *  사용자롭터 n개의 정수를 입력받아 배열에 저장한 후 짝수 인덱스에 저장된 수는 그대로 두고
 *  홀수 인덱스에 저장된 수들은 오름차순으로 정려라여 출력하는 프로그램을 작성하라.
 *  예를 들어 입력된 정수들이
 *  1 7 4 12 5 10 9 7이라면
 *  출력은 1 7 4 7 5 10 9 12
 *  
 *  index 1 3  5  7 ...
 *        7 12 10 7 ... 을 정렬
 *        7 7  10 12 ...
 */

public class Task9
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
		
		for(int i=1; i<n; i+=2)
		{
			for(int j=1; j<n-i; j+=2)
			{
				if(data[j] > data[j+2])
				{
					int tmp = data[j];
					data[j] = data[j+2];
					data[j+2] = tmp;
				}
			}
		}
		System.out.println(Arrays.toString(data));
	}
}
