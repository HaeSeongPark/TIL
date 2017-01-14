package ch7;

public class BindingTest3 {
	public static void main(String[] args) {
		BT3Parent p = new BT3Child();
		BT3Child c = new BT3Child();
		
		System.out.println("p.x = " + p.x);
		p.method();
		System.out.println();
		System.out.println("c.x = "+c.x);
		c.method();
	}
}

class BT3Parent{
	int x = 100;
	
	void method(){
		System.out.println("Parent Method");
	}
}

class BT3Child extends BT3Parent{
	int x = 200;
	void method(){
		System.out.println("x="+x);
		System.out.println("super.x="+super.x);
		System.out.println("this. x="+this.x);
	}
}
