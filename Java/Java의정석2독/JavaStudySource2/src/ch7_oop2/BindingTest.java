package ch7_oop2;

public class BindingTest {
	public static void main(String[] args) {
		ParentB p = new ChildB();
		ChildB c = new ChildB();
		
		System.out.println("p.x = " + p.x);
		p.method();
		
		System.out.println("c.x = " + c.x);
		c.method();
	}
}

class ParentB{
	int x = 100;
	
	 void method(){
		System.out.println("Parent Method");
	}
}

class ChildB extends ParentB{
	int x = 200;
	
	 void method(){
		System.out.println("Child Method");
	}
}