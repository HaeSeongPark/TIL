package ch13_Excercise;

public class Ch13_1 {
	public static void main(String[] args) {
		new Thread(new Runnable1()).start();
	}
}

class Runnable1 implements Runnable{
	@Override
	public void run() {
		for(int i=0; i<300; i++)
			System.out.print("-");
	}
}
