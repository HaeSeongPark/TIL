package ch8;

public class FinallyTest3 {
	
	static void method1(){
		try {
			System.out.println("method1()이 호출됐습니다.");
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			System.out.println("method1()으 finally블럭이 실행됨");
			/*
			 * try블럭에서 return문이 실행되되 finally블럭의 문장들이 먼저 실행된 후에, 
			 * 현재 실행 중인 메서드를 종료
			 */
		}
	}
	
	public static void main(String[] args) {
		method1();
		System.out.println("method1()의 수행을 마치고 main메서드로 돌아왔음");
	}

}
