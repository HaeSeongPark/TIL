package ch9_lang;

class Card{
	String kind;
	int number;
	
	Card(){
		this("SPADE",1);
	}
	Card(String kind, int number){
		this.kind = kind;
		this.number = number;
	}
	
	public String toString(){
		return "kind : " + kind + ", number : " + number;
	}
}

public class CardToString {
	public static void main(String[] args) {
		Card c1 = new Card();
		Card c2 = new Card("HEART", 100);
		
		System.out.println(c1);
		System.out.println(c2.toString());
	}
}
