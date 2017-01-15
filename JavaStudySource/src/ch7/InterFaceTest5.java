package ch7;

interface I5{
	public abstract void methodB();
}

class InstanceManager{
	public static I5 getInstance(){
		return new B5();
	}
}

class A5{
	void methodA(){
		I5 i = InstanceManager.getInstance();
		i.methodB();
		System.out.println(i.toString());
	}
}

class B5 implements I5{
	public void methodB(){
		System.out.println("methodB in b Class");
	}
	public String toString() { return "class B";}
}

public class InterFaceTest5 {

	public static void main(String[] args) {
		A5 a = new A5();
		a.methodA();
	}
}
