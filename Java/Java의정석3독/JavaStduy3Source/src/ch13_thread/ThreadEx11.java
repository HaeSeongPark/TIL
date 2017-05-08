package ch13_thread;

import java.util.*;

public class ThreadEx11
{

	public static void main(String [] args)
	{
		ThreadEx11_1 t1 = new ThreadEx11_1("Thread1");
		ThreadEx11_2 t2 = new ThreadEx11_2("Thread2");
		
		t1.start();
		t2.start();
	}

}

class ThreadEx11_1 extends Thread
{
	ThreadEx11_1(String name)
	{
		super(name);
	}
	
	@Override
	public void run()
	{
		try
		{
			sleep(5*1000);
		}
		catch ( Exception e )
		{
			// TODO: handle exception
		}
	}
}

class ThreadEx11_2 extends Thread
{
	ThreadEx11_2(String name)
	{
		super(name);
	}
	
	@Override
	public void run()
	{
		Map<Thread , StackTraceElement []> map = getAllStackTraces();
		Iterator<Thread> it = map.keySet().iterator();
		
		int x=0;
		while(it.hasNext())
		{
			Thread t = it.next();
			StackTraceElement[] ste = map.get(t);
			System.out.println("["+ ++x +"] name : " + t.getName()
							+ ", group : " + t.getThreadGroup().getName()
							+ ", daemon : " + t.isDaemon());
			
			for(int i=0; i<ste.length; i++)
				System.out.println(ste[i]);
			
			System.out.println();
		}
	}
}