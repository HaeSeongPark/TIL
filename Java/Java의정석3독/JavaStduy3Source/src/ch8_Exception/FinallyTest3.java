package ch8_Exception;

public class FinallyTest3 {
	public static void main(String[] args) {
		method1();
		System.out.println("끝");
	}
	static void method1(){
		try {
			System.out.println("method1()이 호출됐습니다.");
			return;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("method1() finally블럭이 실해됐습니다.");
		}
	}
	
	/*  retrun문 장을 만나도 메소드가 바로 종료되지 않고 finally안에 있는 문장들을 실행한 후 종료 된다.
	 *  method1()이 호출됐습니다.
		method1() finally블럭이 실해됐습니다.
		끝
	 */
}
