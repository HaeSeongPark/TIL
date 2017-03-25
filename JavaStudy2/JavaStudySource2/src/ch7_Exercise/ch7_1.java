package ch7_Exercise;

class SutdaDeck {
	final int CARD_NUM = 20;
	SutdaCard[] cards = new SutdaCard[CARD_NUM];
	
	SutdaDeck(){
//		for(int i=0; i<20; i++){
//			int num = (i+1) % 10 != 0 ? (i+1) % 10 : 10;
//			boolean isKwang = false;
//			if(i==0 || i==2 || i==7)
//				isKwang = true;
//			cards[i] = new SutdaCard(num,isKwang);
//		}
		
		for(int i=0; i < cards.length; i++){
			int num = i%10+1;
			boolean isKwang = ( i < 10) && (num==1||num==3||num==8);
			cards[i] = new SutdaCard(num,isKwang);

		}
	}
	
	void shuffle(){
		for(int i=0; i<cards.length; i++){
			int randomIndex = (int)(Math.random()*cards.length);
			SutdaCard tmp;
			tmp = cards[i];
			cards[i] = cards[randomIndex];
			cards[randomIndex] = tmp;
		}
	}
	
	SutdaCard pick(int index){
		if(index < 0 || index >= CARD_NUM)
			return null;
		return cards[index];
	}
	
	SutdaCard pick(){
		int randomIndex = (int)(Math.random()*cards.length);
//		return pick(randomIndex);
		return cards[randomIndex];
		
	}
}

class SutdaCard{
	final int NUM;
	final boolean IS_KWANG;
	SutdaCard(){
		this(1, true);
	}
	
	SutdaCard(int num, boolean isKwang){
		this.NUM = num;
		this.IS_KWANG = isKwang;
	}
	
	public String toString() {
		return NUM + ( IS_KWANG ? "K" : "");
	}
}

public class ch7_1 {
	public static void main(String[] args) {
		SutdaDeck deck = new SutdaDeck();
		
		System.out.println(deck.pick(0));
		System.out.println(deck.pick());
		
		for(int i=0; i < deck.cards.length; i++)
			System.out.print(deck.cards[i]+",");
		
		System.out.println();
		deck.shuffle();
		
		for(int i=0; i < deck.cards.length; i++)
			System.out.print(deck.cards[i]+",");
		System.out.println();
		System.out.println(deck.pick(0));
	}
}
