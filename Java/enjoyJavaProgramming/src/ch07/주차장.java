package ch07;

public class 주차장
{
	public void 주차(자동차 c)
	{
		//자동차는 추상 class 인스턴스가 될 수 없다.
		//주차메소드에 자동차는 못 온다.
		//자식들만 올 수 있음
		c.달리다();
	}
	public 자동차 get()
	{
		return new 스포츠카();
	}
}
