package ch1_1;

import java.util.Arrays;
import java.util.Scanner;


/*
 * n개의 정수를 입력받아 순서대로 배열에 저장한다.
 * 그런 다음 모든 정수들을 한 칸씩 오른쪽으로 이동
 * 마지막 정수는 배열의 첫 칸으로 이동
 */
public class Code9
{
	public static void main(String [] args)
	{
		Scanner s = new Scanner(System.in);
		int n = s.nextInt();
		int[] num = new int[n];
		
		for(int i=0; i<n; i++)
			num[i] = s.nextInt();
		s.close();
		
		int lastToFirst = num[n-1];
		for(int i=n-2; i>=0; i--)
		{
			num[i+1] = num[i];
		}
		num[0] = lastToFirst;
		
		System.out.println(Arrays.toString(num));
	}
}
