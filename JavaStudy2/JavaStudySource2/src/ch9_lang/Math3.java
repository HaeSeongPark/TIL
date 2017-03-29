package ch9_lang;

import static java.lang.Math.*;

public class Math3 {
	public static void main(String[] args) {
		int x1=1, y1=1;
		int x2=2, y2=2;
		
		double c = sqrt(pow(x2-x1,2) + pow(y2-y1,2));
		double a = c * sin(PI/4); // PI/4 rad = 45 degree
		double b = c * cos(PI/4);
//		double b = c * cos(toRadians(45));
		
		System.out.printf("a=%f%n", a);
		System.out.printf("b=%f%n", b);
		System.out.printf("c=%f%n", c);
		System.out.printf("angle=%f rad%n",atan2(a,b));
		System.out.printf("angle=%f degree%n%n",atan2(a,b) * 180 / PI );
		System.out.printf("angle=%f degree%n%n",toDegrees(atan2(a,b)));
		
		System.out.printf("24 * log10(2) = %f%n", 24 * log10(2)); // 7.224720
		System.out.printf("53 * long10(2) = %f%n", 53 * log10(2)); // 15.954590
		
		/*
		 * a=1.000000
			b=1.000000
			c=1.414214
			angle=0.785398 rad
			angle=45.000000 degree
			
			angle=45.000000 degree
			
			24 * log10(2) = 7.224720
			53 * long10(2) = 15.954590
		 */
	}
}
