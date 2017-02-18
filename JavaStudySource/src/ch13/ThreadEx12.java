package ch13;

public class ThreadEx12 {

	public static void main(String[] args) {
		ThreadEx12_1 th1 = new ThreadEx12_1();
		ThreadEx12_2 th2 = new ThreadEx12_2();
		
		th1.start();
		th2.start();
		
		try {
			th1.sleep(2000);
//			Thread.sleep(2000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		System.out.print("<<main 종료>>");
		//th1.sleep(2000)했음에도 th1이 먼저 끝남
		//sleep()이 항상 현재 실행중인 쓰레드에 대해 작동하기 때문에
		//th1.sleep(2000)은 실제로 main스레드에 적용됨
		//그래서 sleep()은 static으로 선언돼 있음
		//따라서 Thread.sleep(2000)으로
		//yield()가 static으로 선언돼 있는 것도 sleep()과 같은 이유
	}

}

class ThreadEx12_1 extends Thread{
	public void run(){
		for(int i=0; i< 300; i++){
			System.out.print("-");
		}
		System.out.print("<<th1 종료>>");
	}
}
class ThreadEx12_2 extends Thread{
	public void run(){
		for(int i=0; i< 300; i++){
			System.out.print("|");
		}
		System.out.print("<<th2 종료>>");
	}
}