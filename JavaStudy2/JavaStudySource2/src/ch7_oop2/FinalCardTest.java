package ch7_oop2;

class finalCard{
	final int NUMBER; // 상수지만 선언과 함께 초기화 하지 않고 , 생성자에서 단 한번만 초기화할 수 있다.
	final String KIND;
	static int widht = 100;
	static int height = 2015;
	
	finalCard(String kind, int num){
		KIND = kind;
		NUMBER = num;
	}
	
	finalCard(){
		this("HEART",1);
	}
	
	public String toString(){
		return KIND + " " + NUMBER;
	}
}

public class FinalCardTest {
	public static void main(String[] args) {
		finalCard c = new finalCard("HEART",10);
//		c.NUMBER = 5; // error
		System.out.println(c.KIND);
		System.out.println(c.NUMBER);
		System.out.println(c);
	}
}
