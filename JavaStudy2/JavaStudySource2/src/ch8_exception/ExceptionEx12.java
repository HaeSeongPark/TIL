package ch8_exception;

public class ExceptionEx12 {
	public static void main(String[] args) throws Exception {
		method1();
	}
	static void method1() throws Exception{
		method2();
	}
	
	static void method2() throws Exception{
		throw new Exception();
	}
}
