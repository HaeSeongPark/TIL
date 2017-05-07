package ch13Exercise;

public class Ch13_2 {

	public static void main(String[] args) {
		Thread2 t1 = new Thread2();
		t1.run();
		for(int i=0; i<10; i++)
			System.out.print(i);
		System.out.println("main");
		/*
		 * start가 아니라 run이라서 0부터9까지 숫자가 순서대로
		 * run하면 그냥 main쓰레드에서 돌아가는거 함수호출하듯이
		 * start해야 다른  쓰레드에서 돌아가는거고
		 */
	}

}
class Thread2 extends Thread{
	public void run(){
		for(int i=0; i<10; i++){
			System.out.print(i);
		}
	}
}