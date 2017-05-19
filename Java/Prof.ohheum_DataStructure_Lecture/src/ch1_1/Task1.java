package ch1_1;

// 1~100,000
/*
 * 1~100,000
 * 사이의 정수들 중 소수의 개수를 세어 출력한느 프로그램
 * 
 */

public class Task1
{
	public static void main(String [] args)
	{
		int primeCount = 0;
		for(int i=2; i<100_000; i++)
		{
			boolean isPrime = true;
			for(int j=2; isPrime && j*j<i; j++)
			{
				if(i%j==0)
					isPrime = false;
			}
			if(isPrime)
				primeCount++;
		}
		System.out.println("primeCount : " + primeCount);
	}
}
