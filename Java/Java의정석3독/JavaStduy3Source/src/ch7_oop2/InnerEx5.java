package ch7_oop2;

class Outer4{
	class InstanceInner{
		int iv = 100;
	}
	static class StaticInner{
		int iv = 200;
		static int cv = 300;
	}
	
	void myMethod(){
		class LocalInner{
			int iv = 400;
		}
	}
}

public class InnerEx5 {
	public static void main(String[] args) {
		Outer4 outer4 = new Outer4();
		Outer4.InstanceInner iI = outer4.new InstanceInner();
		System.out.println(iI.iv);
		
		System.out.println(	Outer4.StaticInner.cv);
		Outer4.StaticInner sI = new Outer4.StaticInner();
		System.out.println(sI.iv);
		
	}
}
