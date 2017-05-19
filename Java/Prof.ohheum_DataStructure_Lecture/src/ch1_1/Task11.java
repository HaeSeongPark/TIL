package ch1_1;

import java.util.Arrays;
import java.util.Scanner;

/*
 * 입력으로 두 행렬(p*q 행렬과 q*r 행렬)을 받아서 두 행렬을 곱한느 프로그램
 * p오 q가 주어지고 
 * 이어지는 p 줄에는 q개의 정수가 주어진다.
 * 두 번째 행렬의 크기 q와 r주어지고
 * 마찬가지로 이어지는 q줄에는 각 줄마다 r개의 정수가 주어진다.
 */

public class Task11
{
	public static void main(String [] args)
	{
		Scanner s = new Scanner(System.in);
		int p = s.nextInt();
		int q = s.nextInt();

		int[][] pq = new int [p][q];
		for ( int i = 0; i < p; i++ )
		{
			for ( int j = 0; j < q; j++ )
			{
				pq[i][j] = s.nextInt();
			}
		}

		q = s.nextInt();
		int r = s.nextInt();

		int[][] qr = new int [q][r];

		for ( int i = 0; i < q; i++ )
		{
			for ( int j = 0; j < r; j++ )
			{
				qr[i][j] = s.nextInt();
			}
		}
		
		int[][] sum = new int[p][r];
		
		for(int i=0; i<p; i++)
		{
			for(int j=0; j<r; j++)
			{
				for(int k=0; k<q; k++)
				{
					sum[i][j] += pq[i][k] * qr[k][j];
				}
			}
		}
		
		for(int i=0; i<sum.length; i++)
		{
			for(int j=0; j<sum[i].length; j++)
			{
				System.out.print(sum[i][j] + " ");
			}
			System.out.println();
		}

	}
}
