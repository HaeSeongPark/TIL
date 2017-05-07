package ch13_thread;

public class ThreadEx2 {
	public static void main(String[] args) {
		ThreadEx2_1 t = new ThreadEx2_1();
		t.start();
		
//		start
//		java.lang.Exception
//		at ch13_thread.ThreadEx2_1.throwException(ThreadEx2.java:16)
//		at ch13_thread.ThreadEx2_1.run(ThreadEx2.java:12)
//		
//		호출스택의 첫 번째 메서드가 main메서드가 아니라 run메서드
//		main 메서드는 이미 종료됨
	}
}

class ThreadEx2_1 extends Thread{
	public void run(){
		throwException();
	}
	public void throwException(){
		try {
			throw new Exception();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}