package ch8_Exception;

public class ExceptionEx13 {
	public static void main(String[] args) {
		method1();
	}
	
	static void method1(){
		try {
			throw new Exception();
		} catch (Exception e) {
			System.out.println("method1에 예외가 처리됐습니다.");
			e.printStackTrace();
		}
	}
}
