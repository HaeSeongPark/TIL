package ch1_1;

import java.util.Scanner;

public class Code13_2
{
	public static void main(String [] args)
	{
		Scanner s = new Scanner(System.in);
		int n = s.nextInt();
		int [] data = new int [n];

		for ( int i = 0; i < n; i++ )
		{
			data[i] = s.nextInt();
		}
		
		s.close();

		int max = 0;
		for ( int i = 0; i < n; i++ )
		{
			StringBuilder sumString = new StringBuilder();
			for ( int j = i; j < n; j++ )
			{
				//  그냥 합치기
				// n이 커지면 오버플로우 발생할 수 있음
				// int : 약 20억 ( 21_4748_3647 ) 
				int sum = 0;
				for(int k=i; k<=j; k++)
					sum = sum * 10 + data[k];
				
				// 소수인지 판별하고
				boolean isPrime = true;
				for ( int k = 2; isPrime && k * k < sum; k++ )
				{
					if ( sum % k == 0 )
						isPrime = false;
				}
				
				// 1이 소수란 걸 제거 해야함
				if ( sum > 1 && isPrime && sum > max )
					max = sum;
			}
		}
		if ( max > 0 )
			System.out.println(max);
		else
			System.out.println("no");
	}
}
