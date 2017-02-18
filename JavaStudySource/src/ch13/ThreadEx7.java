package ch13;

import javax.swing.JOptionPane;

public class ThreadEx7 {

	public static void main(String[] args) {
		
		Thread7 t7= new Thread7();
		t7.start();
		
		String input = JOptionPane.showInputDialog("아무값이나 입력하세요.");
		System.out.println("입력하신 값은 "+input+"입니다.");
		

	}

}
class Thread7 extends Thread{
	public void run(){
		for(int i=10; i >0; i--){
			System.out.println(i);
			try{
				Thread.sleep(1000);
			}catch(Exception e){}
		}
	}
}
