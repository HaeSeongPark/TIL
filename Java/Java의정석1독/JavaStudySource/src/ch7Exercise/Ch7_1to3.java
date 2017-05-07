package ch7Exercise;

class SutdaDeck{
	final int CARD_NUM = 20;
	SutdaCard[] cards = new SutdaCard[CARD_NUM];
	//7-1
	SutdaDeck(){
		for(int i=0; i<cards.length ; i++){
			int num = i%10+1;
			boolean isKwang = (i<10)&&(num==1||num==3||num==8);
			cards[i] = new SutdaCard(num,isKwang);
//			if((i+1) == 1 || (i+1) == 3 || (i+1) == 8)
//				cards[i] = new SutdaCard((i+1) % 10 ,true);
//			else if((i+1)%10 == 0)
//				cards[i] = new SutdaCard(10 ,false);
//			else{
//				cards[i] = new SutdaCard((i+1) % 10 ,false);
//			}
		}
	}
	void shuffle(){
		for(int i=0; i<cards.length; i++){
			int random = (int)(Math.random()*cards.length);
			SutdaCard tmp = cards[i];
			cards[i] = cards[random];
			cards[random] = tmp;
		}
	}
	SutdaCard pick(int index){
		if(index < 0 || index>=CARD_NUM) return null;
		return cards[index];
	}
	SutdaCard pick(){
		int random = (int)(Math.random()*cards.length);
//		return pick(random); 비효율적인 객체지향적인 코드
		return cards[random];
	}
}

class SutdaCard{
	int num;
	boolean isKwang;
	
	SutdaCard(){
		this(1, true);
	}
	SutdaCard(int num, boolean isKwang){
		this.num = num;
		this.isKwang = isKwang;
	}
	public String toString(){
		return num + (isKwang? "K":"");
	}
}

public class Ch7_1to3 {
	public static void main(String[] args) {
		SutdaDeck deck = new SutdaDeck();
		
		System.out.println(deck.pick(0));
		System.out.println(deck.pick());
		deck.shuffle();
		
		for(int i=0; i<deck.cards.length;i++){
			System.out.print(deck.cards[i]+",");
		}
		System.out.println();
		System.out.println(deck.pick(0));
	}

}
/*
 * 오버라이딩의 정의와 필요성
 * 오버라이딩이란 조상 클래스에서 상속받은 메서드를 자손 클르새에 맞게 재정의 하는 것
 * 조상 클래스로 부터 상속 받은 메서드를 자손 클래스에서 그대로 사용할 수 없는 경우가 많기 때문 
 */
