package ch7_oop2;

public class BindingTest2 {
	public static void main(String[] args) {
		ParentB2 p = new ChildB2();
		ChildB2 c = new ChildB2();
		
		System.out.println("p.x = " + p.x);
		p.method();
		
		System.out.println("c.x = " + c.x);
		c.method();
	}
}

class ParentB2{
	int x = 100;
	
	 void method(){
		System.out.println("Parent Method");
	}
}

class ChildB2 extends ParentB2{
}