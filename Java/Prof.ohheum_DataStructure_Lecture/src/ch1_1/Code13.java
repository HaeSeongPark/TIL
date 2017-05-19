package ch1_1;

import java.util.Scanner;

/*
 * n개의 음이 아닌 한 자리 정수를 입력받아 배열에 저장한다.
 * 이들 중에 1개 이상의 연속된 정수들을 합하여 얻을 수 있는
 * 소수들 중에서 최대값을 구하여 출력하는 프로그램을 작성하라.
 * 
 * 1 9 4 0 7 1 3 6 2 3
 * 7 1 3으로 해석
 * 
 * i = 0 ~ n-1
 * j = i ~ n-1
 * 더하는 게 아니라 합쳐서 소수인지 판별하고
 * 소수가 아니면 continue;
 * 소수이면 max와 비교해서 크면 max에 대입
 */

public class Code13
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
				sumString.append(data[j]); // 합쳐셔
				int sum = Integer.parseInt(sumString.toString()); // int로 바꾸고
				// 소수인지 판별하고
				boolean isPrime = true;
				for ( int k = 2; isPrime && k * k < sum; k++ )
				{
					if ( sum % k == 0 )
						isPrime = false;
				}
				// 1이 소수란 걸 제거
				// 숫자가 커지면 int에 담지 못함
//				소수이면서 max보다 크면 바꿈
				if ( isPrime && sum > max )
					max = sum;
			}
		}
		if ( max > 0 )
			System.out.println(max);
		else
			System.out.println("no");
	}
}
