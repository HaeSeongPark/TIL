package ch7;

public class InnerEx1 {
	class InstanceInner{
		int iv = 100;
//		static int cv = 100;  // 에러, static변수를 선언할 수 없다. 
							  // static클래스만 static 멤버를 가질 수 있다.
		final static int CONST = 100; // final static은 상수이므로 허용한다.
	}
	static class StaticInner{
		int iv = 200;
		static int cv = 200; // static클래스만 static멤버를 정의할 수 있다.
	}
	void myMethod(){
		class LocalInner{
			int iv = 300;
//			static int cv = 300; // 에러, static 변수를 선언할 수 없다.
								 // static클래스만 static 멤버를 가질 수 있다.

			final static int CONTS = 300; // final staitc은 상수이므로 허용한다.
		}
	}
	public static void main(String[] args) {
		System.out.println(InstanceInner.CONST);
		System.out.println(StaticInner.cv);
	}
}
