package ch7_oop2;

public class BindingTest3 
{
	public static void main(String[] args) 
	{
		ParentB3 p = new ChildB3();
		ChildB3 c = new ChildB3();
		
		System.out.println("p.x="+p.x); //100
		p.method();  // 200, 200, 100
		System.out.println();
		
		System.out.println("c.x="+c.x); // 200
		c.method(); // 200,200,100
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