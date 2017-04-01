package ch7_Exercise;

class Parent20{
	int x = 100;
	
	void method(){
		System.out.println("Parent Method");
	}
}

class Child20 extends Parent20{
	int x = 200;
	
	void method(){
		System.out.println("Child Method");
	}
}

public class Ch7_20 {
	public static void main(String[] args) {
		Parent20 p = new Child20();
		Child20 c = new Child20();
		
		System.out.println("p.x = " + p.x);
		p.method();
		
		System.out.println("c. = " + c.x);
		c.method();
		/*
		 * 변수가 중복된 경우 참조타입에 영향
		 * 메소드가 중복된 경우 실제인스턴스에 영향
		 * 따라서 p.x = 100  c.x = 200
		 * p.method, c.method  = CHildMethod
		 */
	}
}
