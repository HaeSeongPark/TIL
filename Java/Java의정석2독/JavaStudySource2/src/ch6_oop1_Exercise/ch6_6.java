package ch6_oop1_Exercise;
/*
 * 두 점의 거리를 계산하는 getDistance()를 완성
 */
public class ch6_6 {
	
	static double getDistance(int x1, int y1, int x2, int y2){
//		return Math.sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1));
		return Math.sqrt(Math.pow(x2-x1, 2) + Math.pow(y2-y1, 2));
	}

	public static void main(String[] args) {
		System.out.println(getDistance(1,1,2,2));
	}

}
