package ch7;

import java.util.Arrays;
import java.util.Vector;

class Product{
	int price;
	int bonusPoint;
	
	Product(int price){
		this.price = price;
		bonusPoint = (int)(price/10.0);
	}
}
class ProductTv extends Product{
	ProductTv(){
		super(100);
	}
	public String toString(){
		return "ProductTv";
	}
}

class Computer extends Product{
	Computer(){
		super(200);
	}
	public String toString(){
		return "Computer";
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

class Buyer{
	int money = 1000;
	int bonusPoint = 0;
	Vector item = new Vector();
	
	void buy(Product p){
		if(money < p.price){
			System.out.println("잔액이 부족하여 물건을 살 수 없습니다.");
			return;
		}
		
		money -= p.price;
		bonusPoint += p.bonusPoint;
		item.add(p);
		System.out.println(p + "을/를 구입하셨습니다.");
	}
	void summary(){
		int sum = 0;
		String itemList = "";
		
		if(item.isEmpty()){
			System.out.println("구입하신 제품이 없습니다.");
			return;
		}
		
		for(int i=0; i<item.size();i++){
			Product p = (Product)item.get(i);
			sum += p.price;
			itemList += (i==0) ? ""+p : ","+p;
			}
		
			System.out.println("구입하신 물품의 총금액은 " + sum + "만원입니다.");
			System.out.println("구입하신 제품은 "+itemList+"입니다.");
		
	}
	void refund(Product p){
		if(item.remove(p)){
			money += p.price;
			bonusPoint -=p.bonusPoint;
			System.out.println(p+"을/를 반품하셨습니다.");
		}
		else{
			System.out.println("구입하신 제품 중 해당 제품이 없습니다.");
		}
	}
}

public class PolyArgumentTest3 {
	public static void main(String[] args) {
		Buyer b = new Buyer();
		Computer com = new Computer();
		
		b.buy(new ProductTv());
		b.buy(com);
		b.buy(new Audio());
		b.summary();
		
		b.refund(com);
		b.summary();
		
		System.out.println("현재 남은 돈은"+b.money+"만원입니다.");
		System.out.println("현재 보너스점수는 "+b.bonusPoint+"입니다.");
		
	}
	
}
