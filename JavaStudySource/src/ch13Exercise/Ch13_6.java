package ch13Exercise;

public class Ch13_6 {

	public static void main(String[] args) throws Exception {
		Thread4 th1 = new Thread4();
		th1.setDaemon(true);
		th1.start();
		
		try {
			Thread.sleep(5*1000);
		} catch (InterruptedException e) {}
		
		throw new Exception("꽝~!!!");
		
		/*
		 * 1초마다 0~5까지 찍다가
		 * 5초 때 꽝!!!하고 끝
		 * th1는 main쓰레드를 도와주는 데몬쓰레드이므로
		 * main쓰레드가 꽝을 찍고 끝나면 같이 끝난다.
		 */
	}

}
class Thread4 extends Thread{
	public void run(){
		for(int i=0; i< 10; i++){
			System.out.println(i);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {}
		}
	}
}