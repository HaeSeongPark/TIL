package ch7_Exercise;

import java.util.Vector;

public class Ch7_19_Vector {
	public static void main(String[] args) {
		Buyer2 b = new Buyer2();
		b.buy(new Tv());
		b.buy(new Computer());
		b.buy(new Tv());
		b.buy(new Audio());
		b.buy(new Computer());
		b.buy(new Computer());
		b.buy(new Computer());
		
		b.summary();
	}
}

class Buyer2{
	int money = 1000;
	Vector<Product> cart = new Vector<>();
	int i = 0;
	
	void buy(Product p){
		if( money < p.price){
			System.out.println("금액이부족하여 " + p + "을/를 살 수 없습니다.");
			return;
		}
		money -= p.price;
		cart.addElement(p);
		
	}
	
	void summary(){
		StringBuilder item = new StringBuilder();
		int sum=0;
		for(int i=0; i<cart.size(); i++){
			item.append(cart.get(i)+",");
			sum += cart.get(i).price;
		}
		System.out.println("구입한 물건 : " + item);
		System.out.println("사용한 금액 : " + sum );
		System.out.println("남은 금액 : " + money);
	}
}
