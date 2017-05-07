package ch7_oop2;

public class Product {
	int price;
	int bonusPoint;
	
	Product(int price){
		this.price = price;
		bonusPoint = (int)(price / 10f);
	}
	
	Product(){
		
	}
}

class Tv extends Product{
	Tv(){
		super(100);
	}
	
	public String toString(){
		return "Tv";
	}
}

class Audio extends Product{
	Audio(){
		super(50);
	}
	
	public String toString(){
		return "Audio";
	}
}

class Computer extends Product{
	Computer(){
		super(200);
	}
	
	public String toString(){
		return "computer";
	}
}