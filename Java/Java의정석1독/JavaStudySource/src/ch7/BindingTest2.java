package ch7;

public class BindingTest2 {
	public static void main(String[] args) {
		BT2Parent p = new BT2Child();
		BT2Child c = new BT2Child();
		
		System.out.println("p.x = " + p.x);
		p.method();
		
		System.out.println("c.x = "+c.x);
		c.method();
	}
}
class BT2Parent{
	int x = 100;
	void method(){
		System.out.println("Parent Method");
	}
}
class BT2Child extends BT2Parent{
	
}
