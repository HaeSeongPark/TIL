package ch13_Exercise;

public class Ch13_7
{
	static boolean stopped = false;

	public static void main(String [] args)
	{
		Thread5 th5 = new Thread5();
		th5.start();

		try
		{
			Thread.sleep(6 * 1000);
		}
		catch ( Exception e )
		{
			// TODO: handle exception
		}
		stopped = true;
		th5.interrupt();
		System.out.println("stopped");
	}
}

class Thread5 extends Thread
{
	@Override
	public void run()
	{
		for ( int i = 0; !Ch13_7.stopped; i++ )
		{
			System.out.println(i);

			try
			{
				Thread.sleep(3 * 1000);
			}
			catch ( Exception e )
			{
				// TODO: handle exception
			}
		}
	}
}