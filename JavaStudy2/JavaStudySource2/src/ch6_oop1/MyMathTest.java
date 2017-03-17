package ch6_oop1;

public class MyMathTest {
	public static void main(String[] args) {
		MyMath mm = new MyMath();
		long result1 = mm.add(5L, 3L);
		long result2 = mm.substract(5L, 3L);
		long result3 = mm.multiply(5L, 3L);
		double result4 = mm.divide(5L, 3L);
		
		System.out.println("add(5L, 3L) = " + result1);
		System.out.println("subtract(5L,3L) = " + result2);
		System.out.println("multiply(5L,3L) = " + result3);
		System.out.println("divide(5L,3L) = " + result4);
	}
}

class MyMath{
	long add(long a, long b){
		return a + b;
	}
	
	long substract(long a, long b){
		return a - b;
	}
	
	long multiply(long a, long b){
		return a * b;
	}
	
	double divide(double a, double b){
		// 작업을 하기 전에 나누는 수(y)가 0인지 확인
		if(b==0){
			System.out.println("0으로 나눌 수 없습니다.");
			return 0;
		}
		return a / b;
	}
}
