package ch7_oop2;

class Outer5{
	int value = 10; // Outer.this.value
	
	class Inner{
		int value = 20; // this.value
		void method1(){
			int value = 30;
			System.out.println(value);
			System.out.println(this.value);
			System.out.println(Outer5.this.value);
		}
	}
}

public class InnerEx4 {
	public static void main(String[] args) {
		Outer5 outer5 = new Outer5();
		Outer5.Inner inner = outer5.new Inner();
		inner.method1();
	}
}
