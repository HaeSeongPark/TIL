package ch7;

public class BindingTest {
	public static void main(String[] args) {
		BTParent p = new BTChild();
		BTChild c = new BTChild();
		
		System.out.println("p.x = " + p.x);
		p.method();
		
		System.out.println("c.x = "+c.x);
		c.method();
	}
}
class BTParent{
	int x = 100;
	void method(){
		System.out.println("Parent Method");
	}
}
class BTChild extends BTParent{
	int x = 200;
	
	void method(){
		System.out.println("Child Method");
	}
}
