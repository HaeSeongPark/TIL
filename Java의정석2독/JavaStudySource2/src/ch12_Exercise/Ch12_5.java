package ch12_Exercise;

public class Ch12_5 {
	public static void main(String[] args) {
		Deck d = new Deck();
		Card c = d.pick(0);
		System.out.println(c);
		
		d.shuffle();
		c = d.pick(0);
		System.out.println(c);
	}
}

class Deck{
	final int CARD_NUM = Card.Kind.values().length
						 * Card.Number.values().length;
	Card cardArr[] = new Card[CARD_NUM];
	
	Deck(){
		int n=0;
		for(Card.Kind kind : Card.Kind.values()){
			for(Card.Number num : Card.Number.values()){
				cardArr[n++] = new Card(kind,num);
			}
		}
	}
	
	Card pick(int index){
		return cardArr[index];
	}
	
	Card pick(){
		int index = (int)(Math.random()*CARD_NUM);
		return pick(index);
	}
	
	void shuffle(){
		for(int i=0; i<cardArr.length; i++){
			int r = (int)(Math.random()*CARD_NUM);
			
			Card temp = cardArr[i];
			cardArr[i] = cardArr[r];
			cardArr[r] = temp;
		}
	}
}

class Card{
	enum Kind { CLOVER, HEART, DIAMOND, SPADE }
	enum Number { ACE, TWO, THREE, FOUR, FIVE,
				  SIX, SEVEN, EIGHT, NINE, TEN,
				  JACK, QUEEN, KING
	}
	
	Kind kind;
	Number num;
	
	Card(Kind kind, Number num){
		this.kind = kind;
		this.num = num;
	}
	
	public String toString(){
		return "[" + kind.name() + "," + num.name() + "]";
	}
}