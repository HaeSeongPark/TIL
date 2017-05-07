package ch13;

public class ThreadEx3 {

	public static void main(String[] args) {
		ThreadEx3_1 t1 = new ThreadEx3_1();
		t1.run();
		
		/*
		 * java.lang.Exception
			at ch13.ThreadEx3_1.throwException(ThreadEx3.java:24)
			at ch13.ThreadEx3_1.run(ThreadEx3.java:20)
			at ch13.ThreadEx3.main(ThreadEx3.java:7)

		 */
	}

}
class ThreadEx3_1 extends Thread{
	public void run(){
		throwException();
	}
	public void throwException(){
		try{
			throw new Exception();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}