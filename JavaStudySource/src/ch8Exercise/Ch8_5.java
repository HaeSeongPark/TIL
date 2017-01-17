package ch8Exercise;
/**
 * 
 * @author rhinoPHS
 *
 */
/**
 * Ch8_1
 * 예외처리의 정의와 목적
 * 정의 : 프로그램 실행 시 발생할 수 있는 예외에 대비한 코드를 작성하는 것
 * 목적 : 프로그램의 비정상종료를 막고 정상적인 실행상태를 유지하는 것
 *
 */
public class Ch8_5 {
	static void method(boolean b){
		try{
			System.out.println(1);
			if(b) throw new ArithmeticException();
			System.out.println(2);
		}catch(RuntimeException r){
			System.out.println(3);
			return;
		}catch(Exception e){
			System.out.println(4);
			return;
		}finally{
			System.out.println(5);
		}
		System.out.println(6);
	}
	public static void main(String[] args) {
		method(true);
		method(false);
	}

}
