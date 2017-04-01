package ch13;

import java.util.*;

public class ThreadEx11 {

	public static void main(String[] args) {
		ThreadEx11_1 t1 = new ThreadEx11_1("Thread1");
		ThreadEx11_2 t2 = new ThreadEx11_2("Thread2");
		t1.start();
		t2.start();
	}
}
class ThreadEx11_1 extends Thread{
	ThreadEx11_1(String name){
		super(name);
	}
	public void run(){
		try {
			sleep(5*1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

class ThreadEx11_2 extends Thread{
	ThreadEx11_2(String name){
		super(name);
	}
	public void run(){
		Map map = getAllStackTraces();
		Iterator it = map.keySet().iterator();
		
		int x=0;
		while(it.hasNext())
		{
			Object obj = it.next();
			Thread t = (Thread)obj;
			StackTraceElement[] ste = (StackTraceElement[])(map.get(obj));
			System.out.println("["+ ++x + "] name : " + t.getName()
							   + ",group : " + t.getThreadGroup().getName()
							   + ", daemon : " + t.isDaemon());
			
			for(int i=0; i<ste.length; i++){
				System.out.println(ste[i]);
			}
			System.out.println();
		}
		
	}
	/*
	 * [1] name : Signal Dispatcher,group : system, daemon : true

		[2] name : Thread2,group : main, daemon : false
		java.lang.Thread.dumpThreads(Native Method)
		java.lang.Thread.getAllStackTraces(Unknown Source)
		ch13.ThreadEx11_2.run(ThreadEx11.java:33)
		
		[3] name : Attach Listener,group : system, daemon : true
		
		[4] name : Finalizer,group : system, daemon : true
		java.lang.Object.wait(Native Method)
		java.lang.ref.ReferenceQueue.remove(Unknown Source)
		java.lang.ref.ReferenceQueue.remove(Unknown Source)
		java.lang.ref.Finalizer$FinalizerThread.run(Unknown Source)
		
		[5] name : Reference Handler,group : system, daemon : true
		java.lang.Object.wait(Native Method)
		java.lang.Object.wait(Unknown Source)
		java.lang.ref.Reference.tryHandlePending(Unknown Source)
		java.lang.ref.Reference$ReferenceHandler.run(Unknown Source)
		
		[6] name : Thread1,group : main, daemon : false
		java.lang.Thread.sleep(Native Method)
		ch13.ThreadEx11_1.run(ThreadEx11.java:20)
	 */
}