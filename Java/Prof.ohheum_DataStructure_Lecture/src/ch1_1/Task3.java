package ch1_1;

import java.util.Scanner;

/*
 * 사용자로 부터 n개의 정수를 받아서 그 중 모든 짝수를 더한 값에
 * 모든 홀수를 뺀 값을 계산해 출력
 * 짝수는 더하고 홀수는 빼고
 */

public class Task3
{
	public static void main(String [] args)
	{
		Scanner s = new Scanner(System.in);
		int n = s.nextInt();
		int sum = 0;
		int input = 0;

		for ( int i = 0; i < n; i++ )
		{
			input = s.nextInt();
			if ( input % 2 == 0 )
				sum += input;
			else
				sum -= input;
		}
		
		System.out.println(sum);
	}
}
