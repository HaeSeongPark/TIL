package ch6Exercise;

//Ch6_6에서 작성한 클래스메서드 getDistance()를 
//MyPoint 클래스의 인스턴스 메서드로 정의

class MyPoint{
	int x;
	int y;
	public MyPoint(int x, int y) {
		super();
		this.x = x;
		this.y = y;
	}
	double getDistance(int x1, int y1)
	{	
		// 루트( (x-x1) * (x-x1) + (y-y1) * (y-y1) )
//		return Math.sqrt( (x-x1) * (x-x1) + (y-y1) * (y-y1));
		return Math.sqrt(Math.pow(x-x1,2)+Math.pow(y-y1,2));
		
		// Math.pow 같이 메서드를 호출하는 것은 곱셈연산보다 비용이 많이 드는 작업!!!
	}
	
}

public class Ch6_7 {
	public static void main(String[] args) {
		MyPoint p = new MyPoint(1,1);
		
		//p와 (2,2)의 거리를 구한다.
		System.out.println(p.getDistance(2,2));
	}

}
