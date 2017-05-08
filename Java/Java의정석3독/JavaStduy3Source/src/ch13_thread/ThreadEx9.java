package ch13_thread;

public class ThreadEx9
{
	public static void main(String [] args)
	{
		ThreadGroup main = Thread.currentThread().getThreadGroup();
		ThreadGroup grp1 = new ThreadGroup("Group1");
		ThreadGroup grp2 = new ThreadGroup("Group2");
		
		ThreadGroup subGrp1 = new ThreadGroup(grp1, "SubGroup1");
		
		grp1.setMaxPriority(3);
		
		Runnable r = new Runnable()
		{
			@Override
			public void run()
			{
				try
				{
					Thread.sleep(1000);
				}
				catch ( Exception e )
				{
					// TODO: handle exception
				}
			}
		};
		
		new Thread(grp1, r, "th1").start();
		new Thread(subGrp1, r, "th2").start();
		new Thread(grp2, r, "th3").start();
		
		System.out.println(">>List of ThreadGroup : " + main.getName()
						+ ", Active ThreadGroup : " + main.activeGroupCount()
						+ ", Active Thread : " + main.activeCount());
		
		main.list();
	}
}
