package ch13_interface;

import java.lang.reflect.Method;

public class DiceTest
{	
	// main메소드 뒤에 throws Exception이라고 적으면 Exception무시 떠넘기기
	public static void main(String [] args) throws Exception
	{
		// 인터페이스도 참조type이 될 수 있다.
		Dice dice1 = new Dice6();
		Dice dice2 = new Dice9();
		
		// Dice type으로 변수를 선언하는 것은
		// 해당 인터페이스를 구현하고 있는 클래스가 무엇이든지 간에 이용 가능
		System.out.println(dice1.get());
		System.out.println(dice2.get());
		
		// 리플렉션
		// 클래스이름은 문자열이니까 설정파일이나 외부로부터 등 다양한 경로로부터 읽을 수 있다.
		String className ="ch13_interface.Dice9";
		// ClassLoader를 이용하여 className에 해당하는 클래스의 정보를 읽어들여서
		// 메모리에 올리고 그 클래스 정보를 가지는 clazz라는 변수를 선언
		// clazz변수를 이용하면 클래스이름, 필드정보, 메소드 정보 등을 구할 수 있다.
		Class clazz = Class.forName(className);
		Method[] methods = clazz.getMethods();
		for(int i=0; i<methods.length; i++)
		{
			System.out.println(methods[i].getName());
		}
		
		// clazz.newInstance(); clazz가 가지고 있는 정보를 이용하여 인스턴스를 만들어라
		// new Dice9();
		Dice dice3 = (Dice)clazz.newInstance();
		Dice dice4 = (Dice)clazz.newInstance();
		System.out.println("dice3 : "+dice3.get());
	}
}
