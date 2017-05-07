package ch8_exception;

public class FinallyTest3 {
	public static void main(String[] args) {
		method1();
		System.out.println("끝");
	}

	static void method1(){
		try {
			System.out.println("method1()이 호출되었습니다.");
			return;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("method1() finally블럭이 실행됐습니다.");
		}
	}
}
