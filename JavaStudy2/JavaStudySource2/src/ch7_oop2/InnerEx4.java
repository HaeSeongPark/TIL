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
		class LcalInner{
			int iv = 400;
		}
	}
}

public class InnerEx4 {
	public static void main(String[] args) {
		// 인스턴스클래스의 인스턴스를 생성하려면
		// 외부 클래스의 인스턴스를 먼저 생성해야 한다.
		Outer4 oc = new Outer4();
		Outer4.InstanceInner il = oc.new InstanceInner();
		
		System.out.println(il.iv);
		System.out.println(Outer4.StaticInner.cv);
		
		// static 내부 클래스의 인스턴스는 외부 클래스를 먼저 생성하지 안않도 된다.
		Outer4.StaticInner si = new Outer4.StaticInner();
		System.out.println(si.iv);
	}
}
