package ch10;

public class MyMath
{
	/*
	 * 생성자가 private하면, 생성자는 있지만
	 * 외부에서 호출 불가
	 * 외부에서 생성자를 이용하여 인스턴스를 생성 못한다.
	 * static한 메서드를 선언하면 클래스의 메서드는 사용가능
	 */
	private MyMath()
	{
		
	}
	
	public static int abs(int value)
	{
		if(value<0)
			return value * -1;
		else
			return value;
	}
}
