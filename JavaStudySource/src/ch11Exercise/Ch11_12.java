package ch11Exercise;

import java.util.*;

class SutdaDeck{
	final int CARD_NUM = 20;
	SutdaCard12[] cards = new SutdaCard12[CARD_NUM];
	
	int pos = 0; // 다음에 가져올 카드의 위치
	HashMap jokbo = new HashMap(); // 족보를 저장할 HashMap
	
	SutdaDeck(){
		for(int i=0; i<cards.length; i++){
			int num = i%10+1;
			boolean isKwang = i<10 && (num==1 || num==3 || num==9);
			
			cards[i] = new SutdaCard12(num, isKwang);
			registerJokbo();
		}
	}
	void registerJokbo(){
		/*
		 * (1) 아래의 로직에 맞게 코드를 작성
		 * jokbo(HashMap)에 족보를 저장
		 * 두 카드의 값을 문자열로 붙여서 key로, 점수를 value로 저장
		 */
		jokbo.put("KK", 4000);
		jokbo.put("1010", 3100);
		jokbo.put("99", 3090);
		jokbo.put("88", 3080);
		jokbo.put("77", 3070);
		jokbo.put("66", 3060);
		jokbo.put("55", 3050);
		jokbo.put("44", 3040);
		jokbo.put("33", 3030);
		jokbo.put("22", 3020);
		jokbo.put("11", 3010);
		
		
		jokbo.put("12", 2060);
		jokbo.put("21", 2060);
		
		jokbo.put("14", 2050);
		jokbo.put("41", 2050);
		
		jokbo.put("19", 2040);
		jokbo.put("91", 2040);
		
		jokbo.put("110", 2030);
		jokbo.put("101", 2030);
		
		jokbo.put("410", 2020);
		jokbo.put("104", 2020);
		
		jokbo.put("46", 2010);
		jokbo.put("64", 2010);
	}
	int getPoint(Player p){
		if(p==null) return 0;
		SutdaCard12 c1 = p.c1;
		SutdaCard12 c2 = p.c2;
		
		Integer result = 0;

//		 1.카드 두장이 모두 광이면, jokbo에서 키를 "KK"로 해서 점수를 조회
		if( c1.isKwang == true && c2.isKwang == true){
			result = (Integer)jokbo.get("KK");
		}else
//	      2. 두 카드의 숫자(num)로 jokbo에서 등급 조회
		  result = (Integer) jokbo.get(""+c1.num+c2.num);
		
//		3. 해당하는 등급이 없으면, 아래의 공식으로 점수 계산
		if(result==null)
			result = new Integer((c1.num + c2.num ) % 10 +1000);

//		4. Player의 점수에 계산한 값을 저장
		p.point = result.intValue();
		 
		
		return result.intValue();
	}
	SutdaCard12 pick() throws Exception{
		SutdaCard12 c = null;
		
		if(0<=pos && pos<CARD_NUM){
			c = cards[pos];
			cards[pos++] = null;
		}else{
			throw new Exception("남아있는 카드가 없습니다.");
		}
		return c;
	}
	void shuffle(){
		for(int x=0; x<CARD_NUM*2; x++){
			int i = (int)(Math.random()*CARD_NUM);
			int j = (int)(Math.random()*CARD_NUM);
			
			SutdaCard12 tmp = cards[i];
			cards[i] = cards[j];
			cards[j] = tmp;
		}
	}
}

class Player{
	String name;
	SutdaCard12 c1;
	SutdaCard12 c2;
	
	int point; // 카드의 등급에 따른 점수
	
	Player(String name, SutdaCard12 c1, SutdaCard12 c2){
		this.name = name;
		this.c1 = c1;
		this.c2 = c2;
	}
	public String toString(){
		return "["+name+"]"+c1.toString() + ","+c2.toString();
	}
}

class SutdaCard12{
	int num;
	boolean isKwang;
	
	SutdaCard12(){
		this(1,true);
	}
	SutdaCard12(int num, boolean isKwang){
		this.num = num;
		this.isKwang = isKwang;
	}
	public String toString(){
		return num + (isKwang?"K":"");
	}
}

public class Ch11_12 {
	public static void main(String[] args) throws Exception{
		SutdaDeck deck = new SutdaDeck();
		
		deck.shuffle();
		
		Player p1 = new Player("타짜",deck.pick(),deck.pick());
		Player p2 = new Player("고수",deck.pick(),deck.pick());
		
		System.out.println(p1+" "+deck.getPoint(p1));
		System.out.println(p2+" "+deck.getPoint(p2));
	}
}
