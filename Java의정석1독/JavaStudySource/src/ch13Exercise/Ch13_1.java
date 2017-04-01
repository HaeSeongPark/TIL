package ch13Exercise;
/*
 * Thread¸¦ Runnable·Î
 */

public class Ch13_1 {
	public static void main(String[] args) {
		Runnable ra = new Runnable1();
		Thread th = new Thread(ra);
		th.start();
		
		
//		Thread1 th = new Thread1();
//		th.start();
	}
}

class Runnable1 implements Runnable{
	public void run(){
		for(int i=0; i<300; i++){
			System.out.print('-');
		}
	}
}

class Thread1 extends Thread{
	public void run(){
		for(int i=0; i<300; i++){
			System.out.print('-');
		}
	}
}