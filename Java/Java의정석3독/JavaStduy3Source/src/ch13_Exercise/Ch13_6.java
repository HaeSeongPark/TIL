package ch13_Exercise;

public class Ch13_6
{
	public static void main(String [] args) throws Exception
	{
		Thread th1 = new Thread(new Thread1());
		th1.setDaemon(true);
		th1.start();
		try
		{
			Thread.sleep(2*1000);
		}
		catch ( Exception e )
		{
			// TODO: handle exception
		}
		throw new Exception("errr");

	}
}

class Thread1 implements Runnable
{
	@Override
	public void run()
	{
		for ( int i = 0; i < 4; i++ )
		{
			System.out.print(i);
			try
			{
				Thread.sleep(1000);
			}
			catch ( Exception e )
			{
				// TODO: handle exception
			}
		}
	}
}