package ch13;

public class ThreadEx8 {

	public static void main(String[] args) {
		ThreadEX8_1 th1 = new ThreadEX8_1();
		ThreadEX8_2 th2 = new ThreadEX8_2();
		
		th2.setPriority(7);
		
		System.out.println("Priority of th1(-) : " + th1.getPriority());
		System.out.println("Priority of th2(|) : " + th2.getPriority());
		
		th1.start();
		th2.start();
	}

}
class ThreadEX8_1 extends Thread{
	public void run(){
		for(int i=0; i<300; i++){
			System.out.print("-");
			for(int x=0; x<10000000;x++);
		}
	}
}

class ThreadEX8_2 extends Thread{
	public void run(){
		for(int i=0; i<300; i++){
			System.out.print("|");
			for(int x=0; x<10000000;x++);
		}
	}
}