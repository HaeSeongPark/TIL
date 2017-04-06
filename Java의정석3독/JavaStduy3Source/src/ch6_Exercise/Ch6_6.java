package ch6_Exercise;

public class Ch6_6 {
	static double getDistance(int x, int y, int x1, int y1){
		return Math.sqrt(Math.pow(x1-x, 2) + Math.pow(y1-y, 2));
//		return Math.sqrt((x1-x)*(x1-x) +(y1-y)*(y1-y));
	}
	public static void main(String[] args) {
		System.out.println(getDistance(1,1,2,2));
	}
}
