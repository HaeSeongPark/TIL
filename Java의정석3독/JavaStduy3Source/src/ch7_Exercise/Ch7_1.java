package ch7_Exercise;

class SutdaDeck{
	final int CARD_NUM = 20;
	SutdaCard[] cards = new SutdaCard[CARD_NUM];
	
	SutdaDeck(){
		for(int i=0; i<cards.length; i++){
			int num = i % 10 + 1;
			boolean isKwang = (i<10) && (num==1 || num==3 || num==8);
			cards[i] = new SutdaCard(num,isKwang);
		}
	}
	void shuffle(){
		for(int i=0; i<cards.length; i++){
			int r = (int)(Math.random()*cards.length);
			SutdaCard tmp = cards[i];
			cards[i] = cards[r];
			cards[r] = tmp;
		}
	}
	
	SutdaCard pick(int index){
		if(index < 0 || index >= CARD_NUM) return null;
		return cards[index];
	}
	
	SutdaCard pick(){
		int r = (int)(Math.random()*cards.length);
		return cards[r];
	}
}

class SutdaCard{
	final int NUM;
	final boolean IS_KWANG;
	
	SutdaCard(){
		this(1,true);
	}
	
	SutdaCard(int num, boolean isKwang){
		this.NUM = num;
		this.IS_KWANG = isKwang;
	}
	
	public String toString(){
		return NUM + (IS_KWANG ? "K" : "");
	}
}

public class Ch7_1 {
	public static void main(String[] args) {
		SutdaDeck deck = new SutdaDeck();
		
		for(int i=0; i<deck.cards.length; i++){
			System.out.print(deck.cards[i] +",");
		}
	}
}
