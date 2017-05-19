package ch1_1;

import java.util.Scanner;
/*
 * 양의 정수 n을 입력받는다.
 * 그런 다음 다음과 같이 n줄을 추력하는
 * 1
 * 12
 * 123
 * 1234
 */

public class Task4
{
	public static void main(String [] args)
	{
		Scanner s = new Scanner(System.in);
		
		int input = s.nextInt();
		
		s.close();
		
		for(int i=1; i<=input; i++)
		{
			for(int j=1; j<=i; j++)
			{
				System.out.print(j + " ");
			}
			System.out.println();
		}
	}
}
