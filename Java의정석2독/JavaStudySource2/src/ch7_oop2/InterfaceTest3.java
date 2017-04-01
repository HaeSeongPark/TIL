package ch7_oop2;

public class InterfaceTest3 {
	public static void main(String[] args) {
		A3 a = new A3();
		a.methodA();
	}
}

interface I3 {
	public abstract void methodB();
}

class InstanceManager{
	public static I3 getInstacne(){
		return new B3();
	}
}

class A3 {
	void methodA() {
		I3 i = InstanceManager.getInstacne();
		i.methodB();
		System.out.println(i.toString());
	}
}

class B3 implements I3{
	@Override
	public void methodB() {
		System.out.println("methodB in B classs");
	}
	public String toString() { return "class B"; }
}

