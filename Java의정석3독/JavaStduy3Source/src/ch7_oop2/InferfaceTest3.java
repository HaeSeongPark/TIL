package ch7_oop2;

public class InferfaceTest3 {
	public static void main(String[] args) {
		A3 a = new A3();
		a.methodA();
	}
}

interface I3{
	void methodB();
}

class InstanceManager{
	public static I3 getInstance(){
		return new B3();
	}
}

class A3{
	void methodA(){
		I3 i = InstanceManager.getInstance();
		i.methodB();
		System.out.println(i);
	}
}

class B3 implements I3{

	@Override
	public void methodB() {
		System.out.println("methodB in B3 class");
	}
	
	public String toString() {
		return "class B";
	}
	
}