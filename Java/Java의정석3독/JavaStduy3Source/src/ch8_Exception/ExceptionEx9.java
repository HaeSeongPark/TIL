package ch8_Exception;

public class ExceptionEx9 {
	public static void main(String[] args) {
		try {
			throw new Exception("예외 발생시키기");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	}
}
