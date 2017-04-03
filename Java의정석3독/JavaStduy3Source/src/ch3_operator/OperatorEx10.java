package ch3_operator;

public class OperatorEx10 {
	public static void main(String[] args) {
		int a = 1000000;
		int r1 = a * a / a;
		int r2 = a / a * a;
		System.out.printf("%d * %d / %d = %d%n",a,a,a,r1);
		System.out.printf("%d / %d * %d = %d%n",a,a,a,r2);
	}
}
