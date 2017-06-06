package ch11;

public class CalBean
{
	//동시
	
	// 싱글턴패턴 1,2,3
	
	// 2) private 하지만 static한 필드를 선언(자기 자신을 참조하는)
	// 자기 자신의 생성자를 호출하여 초기화 한다.
	// static은 인스턴스가 만들어지기 전에 호출되는 코드. 딱 한 번.
	private static CalBean instance = new CalBean();
	
	// 3) 2번에서 instacne를 반환하는 public static메소드를 만든다.
	public static CalBean getInstance()
	{
		// 외부에서 인스턴스를 못 만들게 함.
		System.out.println("getInstance!");
		return instance;
	}
	
	// 1) private 한 생성자를 만듬.
	private CalBean()
	{
		System.out.println("CalBean() : 생성자");
	}
	
	public int plus(int i, int m)
	{
		return i+m;
	}
}
