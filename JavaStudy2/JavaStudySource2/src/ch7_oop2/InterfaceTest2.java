package ch7_oop2;

public class InterfaceTest2 {

	public static void main(String[] args) {
		A2 a = new A2();
		a.autoPlay(new B2());
		a.autoPlay(new C2());
	}

}

interface I {
	public abstract void play();
}

class A2{
	void autoPlay(I i){
		i.play();
	}
}

class B2 implements I {
	@Override
	public void play() {
		System.out.println("play in B2 class");
	}
}

class C2 implements I {
	@Override
	public void play() {
		System.out.println("play in C2 class");
	}
}