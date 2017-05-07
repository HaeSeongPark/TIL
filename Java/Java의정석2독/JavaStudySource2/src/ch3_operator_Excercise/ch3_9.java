package ch3_operator_Excercise;

public class ch3_9 {
	public static void main(String[] args) {
		char ch = 'z';
		boolean b = ('a'<=ch && ch  <='z') || ('A'<= ch && ch <='Z') || ('0' <= ch && ch <='9');
		System.out.println(b);
	}
}
