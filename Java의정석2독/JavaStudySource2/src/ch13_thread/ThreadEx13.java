package ch13_thread;

import javax.swing.JOptionPane;

public class ThreadEx13 {
	public static void main(String[] args) {
		ThreadEx13_1 th1 = new ThreadEx13_1();
		th1.start();
		
		String input = JOptionPane.showInputDialog("아무값이나 입력하세요");
		System.out.println("입력하신 것은 " + input + "입니다.");
		th1.interrupt();
		System.out.println("isInterupted():"+th1.isInterrupted());
	}
}

class ThreadEx13_1 extends Thread{
	public void run(){
		int i = 10;
		
		while(i!=0 && !isInterrupted()){
			System.out.println(i--);
			try {
				Thread.sleep(1000);
			} catch (Exception e) {
				interrupt();
			}
		}
		System.out.println("카운트 다운 종료");
	}
}
