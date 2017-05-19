package ch1_1;

import java.util.Scanner;

/*
 * 사용자로부터 4개의 정수를 받아서 최대값과 최소값구하고
 * 그 2개를 뺀 값
 * 입력형식은 Task3과 같음
 */

public class Task5
{
	public static void main(String [] args)
	{
		Scanner s = new Scanner(System.in);
		
		int n = s.nextInt();
		
		int max = 0;
		int min = 0; 
		int input = 0;
		max = min = s.nextInt();
		
		for(int i=0; i<n-1; i++)
		{
			input = s.nextInt();
			if(input>max)
				max = input;
			if(input < min)
				min = input;
		}
		
		s.close();
		
		System.out.println(max-min);
	}
}
