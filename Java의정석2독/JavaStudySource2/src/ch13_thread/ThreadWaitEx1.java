package ch13_thread;

import java.util.ArrayList;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class ThreadWaitEx1 {
	public static void main(String[] args) throws Exception {
		Table table = new Table(); // 여러 쓰레드가 공유하는 객체

		new Thread(new Cook(table), "COOK1").start();
		new Thread(new Customer(table, "donut"), "CUST1").start();
		new Thread(new Customer(table, "burger"), "CUST2").start();

		Thread.sleep(2000);
		System.exit(0);
	}
}

class Customer implements Runnable {
	private Table table;
	private String food;

	Customer(Table table, String food) {
		this.table = table;
		this.food = food;
	}

	public void run() {
		while (true) {
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
			}

			String name = Thread.currentThread().getName();
			table.remove(food);
			System.out.println(name + "ate a " + food);
		}
	}

}

class Cook implements Runnable {
	private Table table;

	Cook(Table table) {
		this.table = table;
	}

	public void run() {
		while (true) {
			int idx = (int) (Math.random() * table.dishNum());
			table.add(table.dishNames[idx]);
			try {
				Thread.sleep(10);
			} catch (InterruptedException e) {
			}
		}
	}
}

class Table {
	String[] dishNames = { "donut", "donut", "burger" };
	final int MAX_FOOD = 6;
	private ArrayList<String> dishes = new ArrayList<>();

	private ReentrantLock lock = new ReentrantLock();
	private Condition forCook = lock.newCondition();
	private Condition forDonut = lock.newCondition();
	private Condition forBurger = lock.newCondition();

	public void add(String dish) {
		lock.lock();

		try {
			while (dishes.size() >= MAX_FOOD) {
				String name = Thread.currentThread().getName();
				System.out.println(name + " is waiting.");
				try {
					forCook.await();
					Thread.sleep(500);
				} catch (Exception e) {}
			}
			dishes.add(dish);
			if(dish.equals("donut"))
				forDonut.signal();
			else
				forBurger.signal();
			System.out.println("Dishess:" + dishes.toString());
		} finally {
			lock.unlock();
		}
	}

	public void remove(String dishName) {
		lock.lock();
		String name = Thread.currentThread().getName();
		
		try {
			while (dishes.size() == 0) {
				wait(name,dishName);
			}

			while (true) {
				for (int i = 0; i < dishes.size(); i++) {
					if (dishName.equals(dishes.get(i))) {
						dishes.remove(i);
						forCook.signal();
						return;
					}
				}
				wait(name, dishName);
			} // while
		} finally {
			lock.unlock();
		}
	}
	
	public void wait(String threadName, String dishName){
		System.out.println(threadName + " is waiting.");
		try {
			if(dishName.equals("donut"))
				forDonut.await();
			else
				forBurger.await();
			Thread.sleep(500);
		} catch (Exception e) {}
	}

	public int dishNum() {
		return dishNames.length;
	}
}