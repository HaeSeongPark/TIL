package ch1_1;

/*
 * 1~100000 사이의 정수들 중에 가장 작은 50개의 소수를 찾아 
 * 그 합을 구하여 출력하는 프로그램을 작성하라.
 * 만약 소수의 개수가 50개 미만이라면 모든 소수의 합을 출력
 * 
 * 일단 1~100_000 의 개수는 9657개니까 50 미만일리는 없고
 * 가장 작은 50개의 소수는 뭐지... 작은 50개 인가 2 3 5 ... 50개될때까지 더하는 건가?
 */

public class Task2
{
	public static void main(String [] args)
	{
		int primeSum = 0;
		int count = 0;
		
		outer :
		for(int i=2; i<100_000; i++)
		{
			boolean isPrime = true;
			for(int j=2; isPrime && j*j<i; j++)
			{
				if(i%j==0)
					isPrime = false;
			}
			
			if(isPrime)
			{
				primeSum += i;
				count++;
				if(count==50)
					break outer;
			}
		}
		
		System.out.println("primeSum : " + primeSum);
		System.out.println(count);
	}
}
