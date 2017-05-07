package ch7_Exercise;

class Buyer {
	int money = 1000;
	Product[] cart = new Product[3];
	int i = 0;

	void buy(Product p) {
		// 가진돈과 물건의 가격을 비교해서 가진 돈이 적으면 메서드 종료
		if (money < p.price) {
			System.out.println("잔액이 부족하여 " + p + "을/를 살  수 없습니다.");
			return;
		} 
			money -= p.price;
			add(p);
		
		// 가진 돈이 충분하면, 제품의 가격을 가진 돈에서 빼고
		// 장바구니에 물건을 담는다. (add메서드 호출)

	}

	void add(Product p) {
		// 1.1 i의 값이 장바구니 크기보다 같거나 크면
		if (i >= cart.length) {
			// 1.1.1 기존의 장바구니보다 2배 큰 새로운 배열 생성
			Product[] tmp = new Product[cart.length * 2];
			// 1.1.2 기존의 장바구니니의 내용을 새로운 배열에 복사
			System.arraycopy(cart, 0, tmp, 0, cart.length);
			// 1.1.3 새로운 장바구니와 기존의 장바구니를 바꾼다.
			cart = tmp;
		} 
		
		cart[i++] = p;
		
		// 1.2 물건을 장바구니(cart)에 저장 그리고 i의 값 1 증가
	}

	void summary() {
		StringBuffer sb = new StringBuffer();
		int sum = 0;

		for (int i = 0; i < cart.length; i++) {
			if (cart[i] == null)
				break;
			sb.append(cart[i].toString() + ",");
			sum += cart[i].price;
		}
		System.out.println(sb);
		System.out.println(sum);
		System.out.println(money);
		// 장바구니에 담긴 물건들의 목록을 만들어 출력
		// 장바구니에 담긴 물건들의 모든 가격
		// money

	}
}

class Product {
	int price;

	Product(int price) {
		this.price = price;
	}
}

class Tv extends Product {
	Tv() {
		super(100);
	}

	public String toString() {
		return "Tv";
	}
}

class Computer extends Product {
	Computer() {
		super(200);
	}

	public String toString() {
		return "Computer";
	}
}

class Audio extends Product {
	Audio() {
		super(50);
	}

	public String toString() {
		return "Audio";
	}
}

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
