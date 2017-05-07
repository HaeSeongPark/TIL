package ch7;

class Parent{ int x = 10; }
class Child extends Parent{
	void method(){
		System.out.println("x="+x);
		System.out.println("this.x="+this.x);
		System.out.println("super.x="+super.x);
	}
}

public class SuperTest {
	public static void main(String[] args) {
		Child c = new Child();
		c.method();
	}
}
