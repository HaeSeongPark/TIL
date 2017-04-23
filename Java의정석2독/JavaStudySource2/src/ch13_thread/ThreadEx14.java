package ch13_thread;

import javax.swing.JOptionPane;

public class ThreadEx14 {
	public static void main(String[] args) {
		ThreadEx14_1 th1 = new ThreadEx14_1();
		th1.start();
		
		String input = JOptionPane.showInputDialog("아무값이나 입력하세요");
		System.out.println("입력하신 것은 " + input + "입니다.");
		th1.interrupt();
		System.out.println("isInterupted():"+th1.isInterrupted());
	}
}
class ThreadEx14_1 extends Thread{
	public void run(){
		int i = 10;
		
		while(i!=0 && !isInterrupted()){
			System.out.println(i--);
			for(long x=0; x<250_0000_000L; x++);
		}
		System.out.println("카운트 다운 종료");
	}
}