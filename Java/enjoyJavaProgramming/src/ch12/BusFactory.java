package ch12;

public class BusFactory extends AbstractFactory
{

	@Override
	protected void init()
	{
		System.out.println("버스 공장 초기화");
	}

	@Override
	protected void make()
	{
		System.out.println("버스 만들기");
	}

	@Override
	protected void clear()
	{
		System.out.println("버스공장청소");
	}

}
