package ch8_Exception;

public class ExceptionEx17 {
	public static void main(String[] args) {
		try {
			method();
		} catch (Exception e) {
			System.out.println("main");
		}
	}
	
	static void method() throws Exception{
		try {
			throw new Exception();
		} catch (Exception e) {
			System.out.println("method");
			throw e;
		}
	}
}
