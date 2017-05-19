package ch1_1;

import java.util.Arrays;
import java.util.Scanner;

/*
 * n개의 정수 입력받고
 * 서로 다르면서 차이가 가장 작은 두 수를 찾는 것
 * n=5 
 * 8 1 6 9 6
 * 차이가 최소인 것은 8과 9이다.
 * 
 * 
 * 정렬 하고 인접한 것들의 차를 구하면
 * 0 1 2 3 4 index
 * 1 6 6 8 9 
 *  5 0 2 1
 *  0 1 2 3 index
 */

public class Task7
{
	public static void main(String [] args)
	{
		Scanner s = new Scanner(System.in);
		int n = s.nextInt();
		int[] data = new int[n];
		int[] diffArr = new int[n-1];
		int minindex = 0;
		int min = 0;
		
		for(int i=0; i<n; i++)
		{
			data[i] = s.nextInt();
		}
		
		Arrays.sort(data);
		
		for(int i=0; i<n-1; i++)
		{
			diffArr[i] = Math.abs(data[i] - data[i+1]);
		}
		
		min = diffArr[0];
		for(int i=1; i<n-1; i++)
		{	
			if( diffArr[i] < min && diffArr[i] !=0)
			{
				min = diffArr[i];
				minindex = i;
			}
		}
		System.out.println(data[minindex] + " " +data[minindex+1]);
	}
}
