package ch13_thread;

public class ThreadEx18 {
	public static void main(String[] args) {
		ThreadEx18_1 th1 = new ThreadEx18_1("*");
		ThreadEx18_1 th2 = new ThreadEx18_1("**");
		ThreadEx18_1 th3 = new ThreadEx18_1("***");
		
		th1.start();
		th2.start();
		th3.start();
		
		try {
			Thread.sleep(2000);
			th1.suspend();
			Thread.sleep(2000);
			th2.suspend();
			Thread.sleep(3000);
			th1.resume();
			Thread.sleep(3000);
			th1.stop();
			th2.stop();
			Thread.sleep(2000);
			th3.stop();
		} catch (Exception e) {}
	}
}

class ThreadEx18_1 implements Runnable{
	volatile boolean suspended = false;
	volatile boolean stopped = false;
	Thread th;
	
	ThreadEx18_1(String name){
		th = new Thread(this,name);
	}
	
	@Override
	public void run() {
		String name = th.getName();
		
		while(!stopped){
			if(!suspended){
				System.out.println(Thread.currentThread().getName());
				try {
					Thread.sleep(1000);
				} catch (Exception e) {
					System.out.println(name + " - interrupted");
				}
			} else {
				Thread.yield();
			}
		}
		System.out.println(Thread.currentThread().getName() + " - stopped");
	}
	
	public void suspend() { 
		suspended = true; 
		th.interrupt();
		System.out.println(th.getName() + " - interrupt() by suspend()");
		}
	public void resume() { suspended = false;}
	public void stop() { 
		stopped = true;
		th.interrupt();
		System.out.println(th.getName() + " - interrupt() by stop()");
		}
	public void start() { th.start();}
	
}