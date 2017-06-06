package ch11_2;

import ch11.MyBean;

public class MyBeantChild extends MyBean
{
	public MyBeantChild()
	{
		// 다른 패키지에서 부모가 가지고 있는 필드 사용가능. 상속받았을 때 
		protectedInt = 100; 
	}
}
