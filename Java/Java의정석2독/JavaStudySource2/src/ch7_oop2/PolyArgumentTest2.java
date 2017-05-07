package ch7_oop2;

public class PolyArgumentTest2 {
	public static void main(String[] args) {
		Buyer b = new Buyer();
		
		b.buy(new TvP());
		b.buy(new ComputerP());
		b.buy(new AudioP());
		b.summary();
	}
}
