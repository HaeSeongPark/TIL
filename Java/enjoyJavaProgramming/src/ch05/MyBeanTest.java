package ch05;

public class MyBeanTest
{
	public static void main(String [] args)
	{
		// 같은 package에 있는 클래스는 import할 필요가 없다.
		
		// MyBean이 가지고 있는 클래스변수 사용할 수 있도록
		// 미리 메모리에 올라간다.
		// 같은 클래스는 디스크에서 딱 한 번만 읽어들인다.
		// 한 번 읽어들인 클래스 정보는 메모리에 올라가 있고,
		// 두 번째 부터는 메모리에 있는 클래스 정보를 사용한다.
		// 1) MyBean.staticValue는 미리 메모리에 올라간다.
		// 2) MyBean인스턴스가 만들어지고 이 인스턴스를 사용할 수 있는
		// bean1참조변수가 만들어진다.
		MyBean bean1 = new MyBean();
		
		// 3) MyBean인스턴스가 만들어지고 이 인스턴스를 사용할 수 있는
		// bean2참조변수가 만들어진다.
		MyBean bean2 = new MyBean();
		MyBean.staticValue = 5;
		System.out.println(MyBean.staticValue);
		bean1.instanceValue = 100;
		System.out.println(bean2.instanceValue);
		System.out.println(bean2.instanceValue);
	}
}
