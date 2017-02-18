package ch13;

import javax.swing.JOptionPane;

public class ThreadEx14 {

	public static void main(String[] args) {
		ThreadEx14_1 th1 = new ThreadEx14_1();
		th1.start();
		
		String input = JOptionPane.showInputDialog("아무값이나");
		System.out.println("입력하신 값은"+input+"입니다.");
		th1.interrupt();
		System.out.println("isInterrupted():"+th1.isInterrupted());
	}

}
class ThreadEx14_1 extends Thread{
	public void run(){
		int i = 10;
		while(i!=0 && !isInterrupted()){
			System.out.println(i--);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
//				Thread.sleep(1000)에서 InterrupttedException발생
//				sleep()에 의해 쓰레드가 잠시 멈춰있을 때, interrupt()를 호출하면
//				InterruptedException이 발생되고 쓰레드의 interrupted상태는 false로 자동 초기화
//				따러서 카운트가 종료되지않는다.
//				이럴 땐 interrupt();를 추가해 ture로 바꿔줘요

			}
		}
		System.out.println("카운트가 종료됐습니다.");
	}
}
