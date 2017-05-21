package ch1_2;

/*
 * 1부터 100_000 사이의 소수를 찾아 출력한다.
 */
public class Code17
{
	public static void main(String [] args)
	{
		for(int i=0; i<100_000; i++)
		{
			if(isPrime(i))
				System.out.println(i);
		}
	}
	// 소수 : 양의 약수가 1과 자기 자신 뿐인 1보다 큰 자연수
	
	static boolean isPrime(int n)
	{
		
		if(n<2) return false;
		
		// i< = sqrt(n)인데
		// 간단히 하기위해 i*i<n으로 함
		// 약수를 쌍을 이루기 때문에
		// 제곱근을 기준으로 큰 게 있으면 제곱근보다 작은 거에서 이미 걸렸을 거임
		
		for(int i=2; i*i<=n; i++)
		{
			if(n%i==0) return false;
		}
		return true;
	}
}
