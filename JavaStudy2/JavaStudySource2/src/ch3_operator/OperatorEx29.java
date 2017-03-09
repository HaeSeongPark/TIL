package ch3_operator;

public class OperatorEx29 {
	public static void main(String[] args) {
		byte p =  10;
		byte n = -10;
		
		System.out.printf(" p = %d \t%s%n", p, OperatorEx28.toBinaryString(p));
		System.out.printf("~p = %d \t%s%n",~p, OperatorEx28.toBinaryString(~p));
		System.out.printf("~p+1=%d \t%s%n",~p+1, OperatorEx28.toBinaryString(~p+1));
		System.out.printf("~~p =%d \t%s%n",~~p, OperatorEx28.toBinaryString(~~p));
		System.out.println();
		System.out.printf(" n = %d%n",n);
		System.out.printf("~(n-1)=%d%n",~(n-1));
	}
}
