package ch13_Exercise;

import javax.swing.JOptionPane;

public class Ch13_9
{

	public static void main(String [] args)
	{
		Ch13_9_1 th = new Ch13_9_1();
		th.start();
		
		String input = JOptionPane.showInputDialog("아무값이나");
		System.out.println("입력하신 값은 " + input + " 입니다.");
		th.interrupt();
	}

}

class Ch13_9_1 extends Thread
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
			{	// InterruptedException이 발생되고 쓰레드의 interrupted상태는 false로 자동 초기화됨
				// 그래서 interrupt를 다시 한 번 호출해서 interrupted상태를 true!
				interrupt();
			}
		}
		System.out.println("카운트 종료");
	}
}