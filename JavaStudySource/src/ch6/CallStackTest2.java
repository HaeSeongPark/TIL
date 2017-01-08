package ch6;

public class CallStackTest2 {
	public static void main(String[] args) {
		System.out.println("main(String[] args)이 시작됐음.");
		firstMethod();
		System.out.println("main(String[] args)이 끝났음.");
	}
	static void firstMethod(){
		System.out.println("firstMethod() 시작");
		secondMethod();
		System.out.println("firstMethod() 끝");
	}
	static void secondMethod(){
		System.out.println("secondMethod()시작");
		System.out.println("secondMethod()끝");
	}
}
