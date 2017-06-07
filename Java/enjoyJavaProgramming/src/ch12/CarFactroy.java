package ch12;

public class CarFactroy extends AbstractFactory
{
	@Override
	protected void init()
	{
		System.out.println("자동차공정 초기화");
	}

	@Override
	protected void make()
	{
		System.out.println("자동차를 만듬");
	}

	@Override
	protected void clear()
	{
		System.out.println("자동차 공정 초기화");
	}

}
