package ch6Exercise;

public class Ch6_6 {
	
	static double getDistance(int x, int y, int x1, int y1)
	{	
		// 루트( (x-x1) * (x-x1) + (y-y1) * (y-y1) )
//		return Math.sqrt( (x-x1) * (x-x1) + (y-y1) * (y-y1));
		return Math.sqrt(Math.pow(x-x1,2)+Math.pow(y-y1,2));
		
		// Math.pow 같이 메서드를 호출하는 것은 곱셈연산보다 비용이 많이 드는 작업!!!
	}
	
	public static void main(String[] args) {
		System.out.println(getDistance(1,1,2,2));
	}
}
