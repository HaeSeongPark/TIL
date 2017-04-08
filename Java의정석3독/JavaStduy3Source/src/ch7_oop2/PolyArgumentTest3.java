package ch7_oop2;

import java.util.ArrayList;

public class PolyArgumentTest3 {
	public static void main(String[] args) {
		Buyer2 b = new Buyer2();
		Tv tv = new Tv();
		Computer com = new Computer();
		Audio audio = new Audio();

		b.buy(tv);
		b.buy(com);
		b.buy(audio);
		b.summary();
		System.out.println();
		b.refund(com);
		b.summary();
	}
}

class Buyer2 {
	int money = 1000;
	int bonusPoint = 0;
	ArrayList<Product> item = new ArrayList<>();

	void buy(Product p) {
		if (money < p.price) {
			System.out.println("잔액부족");
			return;
		}

		money -= p.price;
		bonusPoint += p.bonusPoint;
		item.add(p);
		System.out.println(p + "을/를 구입하셨습니다.");
	}

	void refund(Product p) {
		if (item.remove(p)) {
			money += p.price;
			bonusPoint -= p.bonusPoint;
			System.out.println(p + "을/를 반품하셨습니다.");
		} else {
			System.out.println("구입하신 제품 중 해당 제품이 없습니다.");
		}
	}

	void summary() {
		int sum = 0;

		StringBuffer itemList = new StringBuffer();
		
		if(item.isEmpty()){
			System.out.println("구입하신 제품이 없습니다.");
			return;
		}

		for (int i = 0, size = item.size(); i < size; i++) {
			Product p = (Product)item.get(i);
			sum+=p.price;
			itemList.append( i==0 ? ""+p : ","+p );
		}
		
		System.out.println("구입하신 물품의 총금액은 " + sum + "만원입니다.");
		System.out.println("구입하신 제품은 " + itemList + "입니다.");
	}

}