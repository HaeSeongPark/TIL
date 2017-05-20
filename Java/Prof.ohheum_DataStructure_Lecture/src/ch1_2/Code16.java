package ch1_2;

import java.util.Scanner;

/*
 * a의 b승 함수쓰기
 */

public class Code16
{
	public static void main(String [] args)
	{
		Scanner s = new Scanner(System.in);
		int a = s.nextInt();
		int b = s.nextInt();
		
		s.close();
		
		int result = power(a,b);
		
		System.out.println(result);
		
	}
	
	static int power(int n, int m)
	{	
		int result = 1;
		for(int i=0; i<m; i++)
			result *= n;
		return result;
	}
}
