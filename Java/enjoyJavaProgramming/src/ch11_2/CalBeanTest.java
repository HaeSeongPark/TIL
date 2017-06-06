package ch11_2;

import ch11.CalBean;

public class CalBeanTest
{
	public static void main(String [] args)
	{
		// 인스턴스를 여러 개 만드는 이유
		// 각각의 인스턴스가 구별돼야 하기 때문
		// 사람에 대한 class가 있다. class는 인스턴스의 틀
		// 그런데 난 인스턴스가 하나만 만들고 싶다. 여려 개 있으면 낭비
		// 그 때 나온 게 singleTon패턴 ex) CalBean.java
		
//		CalBean cal = new CalBean();
		System.out.println("------------------------");
		CalBean bean = CalBean.getInstance();
		CalBean bean2 = CalBean.getInstance();
		System.out.println("------------------------");
		if(bean == bean2)
			System.out.println("bean==bean2 ? yes");
		else
			System.out.println("bean==bean2 ? no");
		
		int value = bean.plus(5 , 10);
		System.out.println(value);
	}
}
