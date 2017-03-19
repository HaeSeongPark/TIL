package ch6_oop1_Exercise;

public class SutdaCard {
	int num;
	boolean isKwang;
	
	SutdaCard(){
		this(1,true);
	}
	
	SutdaCard(int num, boolean isKwang){
		this.num = num;
		this.isKwang = isKwang;
	}
	
	String info(){
		return num + (isKwang ? "K" : "");
	}

}
