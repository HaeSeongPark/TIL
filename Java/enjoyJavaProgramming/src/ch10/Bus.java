package ch10;

public class Bus extends Car
{
	public Bus()
	{
		super("bus"); // super는 부모를 의미
				 // super()는 부모의 기본생성자
				 // 자동생성
	   /*
	    * 부모가 기본생성자가 없다면
	    * 프로그래머가 반드시 생성자를 직접 호출해야한다.
	    */
	}
}
