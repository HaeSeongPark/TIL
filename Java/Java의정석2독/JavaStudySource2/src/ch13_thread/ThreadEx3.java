package ch13_thread;

public class ThreadEx3 {
	public static void main(String[] args) {
		ThreadEx2_1 t = new ThreadEx2_1();
		t.run();
	}
	/* run()
	 * java.lang.Exception
		at ch13_thread.ThreadEx2_1.throwException(ThreadEx2.java:16)
		at ch13_thread.ThreadEx2_1.run(ThreadEx2.java:12)
		at ch13_thread.ThreadEx3.main(ThreadEx3.java:6)
	 */
}
