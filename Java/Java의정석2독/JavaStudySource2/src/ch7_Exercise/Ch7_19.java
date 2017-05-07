package ch7_Exercise;

public class Ch7_19 {
	public static void main(String[] args) {
		Buyer b = new Buyer();
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

class Buyer{
	int money = 1000;
	Product[] cart = new Product[3];
	int i = 0;
	
	void buy(Product p){
		if( money < p.price){
			System.out.println("금액이부족하여 " + p + "을/를 살 수 없습니다.");
			return;
		}
		
		money -= p.price;
		add(p);
	}
	
	void add(Product p){
		if( i >= cart.length){
			Product[] newCart = new Product[cart.length*2];
			System.arraycopy(cart, 0, newCart, 0, cart.length);
			cart = newCart;
		} 
		
		cart[i++] = p;
		
	}
	
	void summary(){
		StringBuilder item = new StringBuilder();
		int sum=0;
		for(int i=0; i<cart.length; i++){
			if(cart[i]==null) break;
			item.append(cart[i]+",");
			sum+=cart[i].price;
		}
		System.out.println("구입한 물건 : " + item);
		System.out.println("사용한 금액 : " + sum );
		System.out.println("남은 금액 : " + money);
	}
}
