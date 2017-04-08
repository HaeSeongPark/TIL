package ch7_oop2;

public class InstanceofTest {
	public static void main(String[] args) {
		FireEngine fe = new FireEngine();

		if (fe instanceof FireEngine) {
			System.out.println("This is a FireEngine instance.");
		}

		if (fe instanceof Car) {
			System.out.println("This is a Car instacne");
		}

		if (fe instanceof Object) {
			System.out.println("This is an Object instance.");
		}

		System.out.println(fe.getClass().getName());
	}
}
