package ch13;

import java.util.ArrayList;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class ThreadWaitEx4 {
	public static void main(String[] args) throws Exception {
		Table4 Table4 = new Table4();

		new Thread(new Cook4(Table4), "Cook4").start();
		new Thread(new Customer4(Table4, "donut"), "CUST1").start();
		new Thread(new Customer4(Table4, "burger"), "CUST2").start();

		Thread.sleep(2000);
		System.exit(0);
	}
}

class Customer4 implements Runnable {
	private Table4 Table4;
	private String food;

	Customer4(Table4 Table4, String food) {
		this.Table4 = Table4;
		this.food = food;
	}

	public void run() {
		while (true) {
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
			}
			String name = Thread.currentThread().getName();

			Table4.remove(food);
			System.out.println(name + " ate a " + food);

		}
	}

}

class Cook4 implements Runnable {
	private Table4 Table4;

	Cook4(Table4 Table4) {
		this.Table4 = Table4;
	}

	public void run() {
		while (true) {
			int idx = (int) (Math.random() * Table4.dishNum());
			Table4.add(Table4.dishNames[idx]);
			try {
				Thread.sleep(1);
			} catch (InterruptedException e) {
			}
		}
	}
}

class Table4 {
	String[] dishNames = { "donut", "donut", "burger" };
	final int MAX_FOOD = 6;

	private ArrayList<String> dishes = new ArrayList<>();

	private ReentrantLock lock = new ReentrantLock();
	private Condition forCook = lock.newCondition();
	private Condition forCust = lock.newCondition();

	public void add(String dish) {
		lock.lock();
		try {
			while (dishes.size() >= MAX_FOOD) {
				String name = Thread.currentThread().getName();
				System.out.println(name + " is wating");
				try {
					forCook.await(); // COOK쓰레드를 기다리게 한다
					Thread.sleep(500);
				} catch (InterruptedException e) {
				}
			}
			dishes.add(dish);
			forCust.signal(); // 기다리고 있는 CUST를 깨우기 위함.
			System.out.println("Dishes:" + dishes.toString());
		} finally {
			lock.unlock();
		}

	}

	public void remove(String dishName) {
		lock.lock(); // synchronized (this) {

		String name = Thread.currentThread().getName();
		try {

			while (dishes.size() == 0) {
				System.out.println(name + " is wating");
				try {
					forCust.await();
					Thread.sleep(500);
				} catch (InterruptedException e) {
				}
			}

			while (true) {
				for (int i = 0; i < dishes.size(); i++) {
					if (dishName.equals(dishes.get(i))) {
						dishes.remove(i);
						forCook.signal();
						return;
					}
				} // for문 끝
				try {
					System.out.println(name + "is waiting.");
					forCust.await();
					Thread.sleep(500);
				} catch (InterruptedException e) {
				}
			} // while(true)
				// } // synchronized
		} finally {
			lock.unlock();
		}
	}

	public int dishNum() {
		return dishNames.length;
	}
}