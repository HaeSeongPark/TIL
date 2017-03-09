package ch3_operator;

public class OperatorEx28 {
	public static void main(String[] args) {
		int x = 0xAB;
		int y = 0xF;
		
		System.out.printf("x = %#X \t\t%s%n",x,toBinaryString(x));
		System.out.printf("y = %#X \t\t%s%n",y,toBinaryString(y));
		System.out.printf("%#X | %#X = %#X \t%s%n", x,y,x|y,toBinaryString(x|y));
		System.out.printf("%#X & %#X = %#X \t%s%n", x,y,x&y,toBinaryString(x&y));
		System.out.printf("%#X ^ %#X = %#X \t%s%n", x,y,x^y,toBinaryString(x^y));
		System.out.printf("%#X ^ %#X ^ %#X = %#X %s%n",x,y,y,x^y^y,toBinaryString(x^y^y));
		
//		String abc = "abc";
//		
//		System.out.println(abc.substring(2));
		
	}
	static String toBinaryString(int x){
		String zero = "000000000000000000000000000000";
		String tmp = zero + Integer.toBinaryString(x);
//		System.out.println("tmp" + tmp);
//		System.out.println("tmp length " + tmp.length());
		return tmp.substring(tmp.length()-32);
	}
}
