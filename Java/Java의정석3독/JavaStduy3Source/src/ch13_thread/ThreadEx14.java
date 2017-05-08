package ch13_thread;

import javax.swing.JOptionPane;

public class ThreadEx14
{
	public static void main(String [] args)
	{
		ThreadEx13_1 t = new ThreadEx13_1();
		t.start();
		
		String input = JOptionPane.showInputDialog("아무값이나입력하세요.");
		System.out.println("입력하신 값은 " + input + "입니다.");
		t.interrupt();
		System.out.println("isInterrupted() : " + t.isInterrupted());
	}
}

class ThreadEx14_1 extends Thread
{
	@Override
	public void run()
	{
		int i = 10;
		
		while(i!=0 && !isInterrupted())
		{
			System.out.println(i--);
			try
			{
				Thread.sleep(1000);
			}
			catch ( Exception e )
			{
				interrupt();
			}
		}
		System.out.println("카운트가 종료됐습니다.");
	}
}
