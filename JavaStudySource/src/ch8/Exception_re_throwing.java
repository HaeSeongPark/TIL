package ch8;

public class Exception_re_throwing {
	public static void main(String[] args) {
		try {
			method1();
		} catch (Exception e) {
			System.out.println("메인 메서드에서 예외가 처리됐습니다.");
		}
	}
	static void method1() throws Exception{
		try {
			throw new Exception();
		} catch (Exception e) {
			System.out.println("메서드1에서 예외가 처리됐습니다.");
			throw e;
		}
		
	}

}
