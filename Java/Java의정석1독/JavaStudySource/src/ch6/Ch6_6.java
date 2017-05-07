package ch6;

class MyMath6_6
{
	long add(long a, long b){return a+b;}
	long subtract(long a, long b){return a-b;}
	long multiply(long a, long b){return a*b;}
	int remainder(int a, int b){return a%b;}
	double divide(double a, double b)
	{	//유효성검사
		if(b==0)
		{
			System.out.println("0으로 나눌 수 없습니다.");
			return 0;
		}
		return a/b;
	}
}

public class Ch6_6 {
	public static void main(String[] args) {
		MyMath6_6 mm = new MyMath6_6();
		long addResult = mm.add(5L, 3L);
		long subResult = mm.subtract(5L, 3L);
		long mulResult = mm.multiply(5L, 3L);
		double divResult = mm.divide(5L,3L);
		
		System.out.println("add(5L,3L)="+addResult);
		System.out.println("sub(5L,3L)="+subResult);
		System.out.println("mul(5L,3L)="+mulResult);
		System.out.println("div(5L,3L)="+divResult);
	}
}
