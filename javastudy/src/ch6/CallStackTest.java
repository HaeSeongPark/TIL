package ch6;

public class CallStackTest {
	public static void main(String[] args) {
		firstMethod();
	}
	static void firstMethod(){
		secondMethod();
		System.out.println("firstMethod()");
	}
	static void secondMethod(){
		System.out.println("secondMethod()");
	}

}
