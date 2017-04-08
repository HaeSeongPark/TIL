package ch7_oop2;

public class Deck {
	final int CARD_NUM = 52;
	Card cardArr[] = new Card[CARD_NUM];
	
	Deck(){
		int i = 0;
		
		for(int k=Card.KIND_MAX; k>0; k--)
			for(int n=0; n<Card.NUM_MAX; n++)
				cardArr[i++] = new Card(k,n+1);
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
			Card tmp = cardArr[i];
			cardArr[i] = cardArr[r];
			cardArr[r] = tmp;
		}
	}
}
