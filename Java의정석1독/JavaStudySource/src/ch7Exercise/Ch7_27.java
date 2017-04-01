package ch7Exercise;

class Outer27{
	int value = 10;
	
	class Inner{
		int value =20;
		void method1(){
			int value = 30;
			
			System.out.println(value);
			System.out.println(this.value);
			System.out.println(Outer27.this.value);
		}
	}
}

public class Ch7_27 {
	public static void main(String[] args) {
		Outer27 outer = new Outer27();
		Outer27.Inner inner = outer.new Inner();
		inner.method1();
	}
}
