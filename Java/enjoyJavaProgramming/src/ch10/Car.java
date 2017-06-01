package ch10;

public class Car
{
	private String name;
	
	// 생성자가 하나라도 있다면 기본생성자는 만들어지지 않는다.
	public Car(String name)
	{
		this.name = name;
		System.out.println("Car 생성자");
	}
	
//	public Car()
//	{
//		
//	}
}
