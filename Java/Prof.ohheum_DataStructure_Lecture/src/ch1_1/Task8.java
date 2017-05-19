package ch1_1;

import java.util.Arrays;
import java.util.Scanner;

/*
 * 사용자로부터 n개의 정수를 입력받아 크기순으로 정렬한 후
 * 중복된 수를 제거 하고 출력
 * n=8;
 * 4 7 4 12 4 10 9 7
 */
public class Task8
{
	public static void main(String [] args)
	{
		Scanner s = new Scanner(System.in);
		int n = s.nextInt();
		int [] data = new int [n];

		for ( int i = 0; i < n; i++ )
			data[i] = s.nextInt();

		s.close();

		Arrays.sort(data);

		int i = 0;
		int cnt = 0;
		while ( i < n )
		{
			int tmp = data[i];
			
			if(i==n-1)
			{
				System.out.print(tmp);
				break;
			}
			while ( tmp == data[++i] )
			{
			}
			System.out.print(tmp + " ");
		}
	}
}
