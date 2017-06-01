package ch09;

// Exception 처리

public class Note
{
	/*
	 * 파라미터가 올바르지 않다면 그 아래 코드는 실행할 필요가 없다.
	 * 사용자 정의 Exception. 이름이 중요!!!
	 * ParameterException(String msg)
	 * 
	 * 되도록이면 RuntimeException을 사용하자
	 * Checked Exception을 사용하면 try~catch문이 많아져서 코드가 복잡해진다
	 * 진짜진짜 중요한 예외만 Exception을 사용하자
	 * 
	 * 잘못된 값을 반환하는 것은 오류가 나서 죽는 것보다 나쁘다. (차라리 프로그램이 죽는게 나을 수 있다)
	 * 잘못 실행됐을 경우네는 올바르지 않은 값을 리턴하는 것이 아니라,
	 * Exception이 발생하도록 한다.
	 * 
	 * 그 발생하는 Exception은 이름이 중요하다.
	 * 메소드 뒤에 throws라고 적은 후 되도록 해당 메소드가 발생하는 Exception들을 적어준다.
	 * 
	 * 해당 메소드를 사용할 때는 throws 뒤에 있는 Exception이 발생할 수 있구나라고 예상하고
	 * 적절히 try catch finally를 사용하여 Exception을 처리한다.
	 * 
	 * RuntimeException은 예외처리를 꼭 안해도 되지만
	 * Exception은 예외처리르 꼭 해야 한다.
	 * 
	 * 메소드에서만 throws를 쓸 수 있음.
	 */
}
