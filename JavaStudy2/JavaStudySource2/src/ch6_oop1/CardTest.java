package ch6_oop1;

class Card{
	String kind;               // 카드의 무늬 - 인스턴스변수
	int number;                // 카드의 숫자 - 인스턴스 변수
	static int width = 100;    // 카드의 폭 - 클래스 변수
	static int height = 250;   // 카드의 높이 - 클래스 변수
}

public class CardTest {
	public static void main(String[] args) {
		System.out.println("Card.width = " + Card.width);
		System.out.println("Card.height = " + Card.height);
		
		Card c1 = new Card();
		c1.kind = "Heart";
		c1.number = 7;
		
		Card c2 = new Card();
		c2.kind = "Spade";
		c2.number = 4;
		
		System.out.println("c1은 " + c1.kind + ", " + c1.number + "이며, 크기는 (" + c1.width + ", " + c1.height + ")");
//		                                                                           클래스 변수를 사용할 때는 클래스이름.클래스변수로 하기
		System.out.printf("c2는 %s, %d이며, 크기는 (%d, %d)%n",c2.kind, c2.number, Card.width, Card.height);
		System.out.println("c1의 width와 height를 각각 50, 80으로 변경합니다.");
		Card.width = 50;
		Card.height = 80;
		
		System.out.println("c1은 " + c1.kind + ", " + c1.number + "이며, 크기는 (" + c1.width + ", " + c1.height + ")");
		System.out.printf("c2는 %s, %d이며, 크기는 (%d, %d)",c2.kind, c2.number, c2.width, c2.height);
	}
}
