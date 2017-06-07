package ch12;

public class CarTest
{
	public static void main(String [] args)
	{
		Car c = new Car();
		c.run();
		
		Bus b1 = new Bus();
		b1.run(); // 부모가 가진 것을 그대로 물려받아서 사용
		b1.bigppangppang(); // 버스에서 정의한 메소드
	}
}
