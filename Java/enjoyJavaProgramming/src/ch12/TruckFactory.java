package ch12;

public class TruckFactory extends AbstractFactory
{

	@Override
	protected void init()
	{
		System.out.println("트럭공장초기화");
	}

	@Override
	protected void make()
	{
		System.out.println("트럭만들기");
		
	}

	@Override
	protected void clear()
	{
		System.out.println("트럭공장청소");
		
	}

}
