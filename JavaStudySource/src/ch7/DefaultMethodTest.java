package ch7;

interface MyInterface{
	default void method1(){
		System.out.println("method1() in MyInterface");
	}
	default void method2(){
		System.out.println("method2() in MyInterface");
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

class ParentD{
	public void method2(){
		System.out.println("method2() in Parent");
	}
}

class ChildD extends ParentD implements MyInterface, MyInterface2{
	public void method1(){
		System.out.println("method1() in Child");  // 오버라이딩
	}
}

public class DefaultMethodTest {
	public static void main(String[] args) {
		ChildD c = new ChildD();
		c.method1();
		c.method2();
		MyInterface.staticMethod();
		MyInterface2.staticMethod();
	}
}
