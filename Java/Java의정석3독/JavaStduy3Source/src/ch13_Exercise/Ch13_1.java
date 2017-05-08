package ch13_Exercise;

public class Ch13_1
{
	public static void main(String [] args)
	{
		Runnable13_1 r = new Runnable13_1();
		new Thread(r).start();
	}
}

class Runnable13_1 implements Runnable
{
	@Override
	public void run()
	{
		for(int i=0; i<300; i++)
			System.out.print("-");
	}
}
