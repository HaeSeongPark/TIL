package ch7;

class CardFinalTest{
	final int NUMBER;        //상수지만 선언과 함께 초기화  하지 않고
	final String KIND;          //생성자에서 단 한번만 초기화할 수 있다.
	static int width = 100;
	static int height = 250;
	
	CardFinalTest(String kind, int num)
	{
		KIND = kind;                //매개변수로 넘겨받은 값으로 상수 KIND와 NUMBER를 초기화한다.
		NUMBER = num;
	}
	CardFinalTest(){
		this("HEART",1);
	}
	public String toString(){
		return KIND + " " + NUMBER;
	}
}

public class FinalCardTest {
	public static void main(String[] args) {
		CardFinalTest c = new CardFinalTest("HEART",15);
//		c.NUMBER=5; // 에러!!!
		System.out.println(c.KIND);
		System.out.println(c.NUMBER);
		System.out.println(c); // System.out.println(c.toString());
	}

}
