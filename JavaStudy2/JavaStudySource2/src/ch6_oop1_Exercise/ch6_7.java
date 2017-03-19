package ch6_oop1_Exercise;

/*
 * getDistance()를 MyPoint클래스의 인스턴스메서드로 정의하시오.
 * 
 */

public class ch6_7 {

	public static void main(String[] args) {
		MyPoint p = new MyPoint(1,1);
		
		System.out.println(p.getDistance(2, 2));
	}

}
