package ch08;

public class MyBeanTest
{
	public static void main(String [] args)
	{
//		MyBean bean = new MyBean();
		BeanInterface bean = new MyBean();
		bean.exec();
	}
}
