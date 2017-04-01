

package ch7_oop2;

public class BindingTest3 {
	public static void main(String[] args) {
		ParentB3 p = new ChildB3();
		ChildB3 c = new ChildB3();
		
		System.out.println("p.x = " + p.x);
		p.method();
		
		System.out.println();
		
		System.out.println("c.x = " + c.x);
		c.method();
	}
}

class ParentB3{
	int x = 100;
	
	 void method(){
		System.out.println("Parent Method");
	}
}

class ChildB3 extends ParentB3{
	int x = 200;
	
	void method(){
		System.out.println("x=" + x);
		System.out.println("this.x=" + this.x);
		System.out.println("super.x=" + super.x);
	}
}