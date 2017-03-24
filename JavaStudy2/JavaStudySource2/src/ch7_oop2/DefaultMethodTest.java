package ch7_oop2;

public class DefaultMethodTest {
	public static void main(String[] args) {
		ChildD c = new ChildD();
		c.method1();
		c.method2();
		
		MyInterface.staticMethod();
		MyInterface2.staticMethod();
	}
}

class ChildD extends ParentD implements MyInterface, MyInterface2{
	public void method1(){
		System.out.println("method1() in Child");
	}
}

class ParentD{
	public void method2(){
		System.out.println("method2() in Parent");
	}
}

interface MyInterface{
	default void method1(){
		System.out.println("method1() int MyInterface");
	}
	default void method2(){
		System.out.println("method2() int MyInterface");
	}
	
	static void staticMethod(){
		System.out.println("staticMethod() in MyInterface");
	}
}

interface MyInterface2{
	default void method1(){
		System.out.println("method1() in MyInterface2");
	}
	
	static void staticMethod(){
		System.out.println("staticMethod() in MyInterface2");
	}
}