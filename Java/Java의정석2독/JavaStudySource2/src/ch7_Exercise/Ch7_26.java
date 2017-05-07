package ch7_Exercise;

class Outer2{
	static class Inner{
		int iv = 200;
	}
}

public class Ch7_26 {
	public static void main(String[] args) {
		Outer2.Inner inner = new Outer2.Inner();
		System.out.println(inner.iv);
	}
}
