package ch13_thread;

public class ThreadEx8 {
	public static void main(String[] args) {
		ThreadEx8_1 t1 = new ThreadEx8_1();
		ThreadEx8_2 t2 = new ThreadEx8_2();
		
		t2.setPriority(7);
		
		System.out.println("Priority of th1(-) : " + t1.getPriority());
		System.out.println("Priority of th2(-) : " + t2.getPriority());
		
		t1.start();
		t2.start();
	}
}

class ThreadEx8_1 extends Thread{
	public void run(){
		for(int i=0; i<300; i++){
			System.out.print("-");
			for(int x=0; x<100_0000; x++);
		}
	}
}

class ThreadEx8_2 extends Thread{
	public void run(){
		for(int i=0; i<300; i++){
			System.out.print("|");
			for(int x=0; x<100_0000; x++);
		}
	}
}