package ch7Exercise;

import ch7Exercise.Outer.Inner;

class Outer26{
	static class Inner{
		int iv= 100;
	}
}

public class Ch7_26 {
	public static void main(String[] args) {
		Outer26.Inner inner = new Outer26.Inner();
		System.out.println(inner.iv);
	}
}
