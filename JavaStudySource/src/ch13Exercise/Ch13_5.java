package ch13Exercise;

public class Ch13_5 {

	public static void main(String[] args) throws Exception {
		Thread3 th1 = new Thread3();
		th1.start();
		
		try {
			Thread.sleep(5*1000);
		} catch (InterruptedException e) {}
		
		throw new Exception("꽝~!!!");
		
		/*
		 * 1초마다 0~5까지 찍다가
		 * 5초 때 꽝!!!
		 * 이후 6~9까지 또 찍고
		 */
	}

}
class Thread3 extends Thread{
	public void run(){
		for(int i=0; i< 10; i++){
			System.out.println(i);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {}
		}
	}
}