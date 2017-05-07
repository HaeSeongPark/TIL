package ch7;

final class Singleton {
	private static Singleton instance = new Singleton();

	private Singleton() {
	}

	public static Singleton getInstance() {
		if (null == instance) {
			instance = new Singleton();
		}
		return instance;
	}

}

public class SingletonTest{
	public static void main(String[] args) {
//		Singleton s = new Singleton();  // ¿¡·¯
		Singleton s = Singleton.getInstance();
	}
}
