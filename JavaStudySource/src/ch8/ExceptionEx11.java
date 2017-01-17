package ch8;

public class ExceptionEx11 {
	public static void main(String[] args) {
		throw new RuntimeException();
		// 컴파일 에러가 나지 않는다.
		// RuntimeException클래스들과 그 자손 클래스에 해당하는 예외는 
		// 프로그래머가 실수로 발생하는 것들이기 때문에 예외처리를 강제하지 않는다.
		
		/*
		 * 컴파일러가 예외처리를 확인하지 않는 RuntimeException클래스들은 'unchecked예외'라고 부르고
		 * 예외처리를 확인하는 Exception클래스들은 'checked예외'라고 부른다.
		 * 
		 * Error와 그 자손도 unchecked예외이다. try - catch블럭으로 처리할 수 없기 때문
		 */
	}
}
