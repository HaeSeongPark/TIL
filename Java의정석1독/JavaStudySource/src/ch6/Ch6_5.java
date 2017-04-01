package ch6;

class Card6_5{
	String kind;
	int number;
	static int width = 100;
	static int height = 250;
}

public class Ch6_5 {
	public static void main(String[] args) {
		System.out.println("Card.widht = " + Card6_5.width);
		System.out.println("Card.widht = " + Card6_5.height);
		
		Card6_5 c1 = new Card6_5();
		c1.kind = "Heart";
		c1.number = 7;
		
		Card6_5 c2 = new Card6_5();
		c2.kind = "Spade";
		c2.number = 4;
		
		System.out.println("c1은 "+c1.kind +","+c1.number + "이며, 크기는  ("+c1.width+","+c1.height+")");
		System.out.println("c2은 "+c2.kind +","+c2.number + "이며, 크기는  ("+c2.width+","+c2.height+")");
		
		Card6_5.width =50;
		Card6_5.height =80;
		
		System.out.println("c1은 "+c1.kind +","+c1.number + "이며, 크기는 ("+c1.width+","+c1.height+")");
		System.out.println("c2은 "+c2.kind +","+c2.number + "이며, 크기는 ("+c2.width+","+c2.height+")");
	}
}
