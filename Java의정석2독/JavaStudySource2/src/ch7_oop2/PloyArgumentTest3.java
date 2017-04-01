package ch7_oop2;

public class PloyArgumentTest3 {
	public static void main(String[] args) {
		Buyer b = new Buyer();
		TvP tv = new TvP();
		ComputerP com = new ComputerP();
		AudioP audio = new AudioP();
		
		b.buy(tv);
		b.buy(com);
		b.buy(audio);
		b.summary();
		System.out.println();
		b.refund(com);
		b.summary();
		
	}
}
