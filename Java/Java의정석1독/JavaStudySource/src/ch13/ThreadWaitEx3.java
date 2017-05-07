package ch13;

import java.util.ArrayList;

public class ThreadWaitEx3 {
	public static void main(String[] args) throws Exception {
		Table3 Table3 = new Table3();

		new Thread(new Cook3(Table3), "Cook31").start();
		new Thread(new Customer3(Table3, "donut"), "CUST1").start();
		new Thread(new Customer3(Table3, "burger"), "CUST2").start();
		
		Thread.sleep(2000);
		System.exit(0);
	}
}

class Customer3 implements Runnable {
	private Table3 table3;
	private String food;

	Customer3(Table3 Table3, String food) {
		this.table3 = Table3;
		this.food = food;
	}

	public void run() {
		while (true) {
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
			}
			String name = Thread.currentThread().getName();
			
			table3.remove(food);
			System.out.println(name+" ate a "+ food);
			
		}
	}


}

class Cook3 implements Runnable {
	private Table3 Table3;

	Cook3(Table3 Table3) {
		this.Table3 = Table3;
	}

	public void run() {
		while (true) {
			int idx = (int) (Math.random() * Table3.dishNum());
			Table3.add(Table3.dishNames[idx]);
			try {
				Thread.sleep(1);
			} catch (InterruptedException e) {
			}
		}
	}
}

class Table3 {
	String[] dishNames = { "donut", "donut", "burger" };
	final int MAX_FOOD = 6;

	private ArrayList<String> dishes = new ArrayList<>();

	public synchronized void add(String dish) {
		while (dishes.size() >= MAX_FOOD) {
			String name = Thread.currentThread().getName();
			System.out.println(name + " is wating");
			try {
				wait(); // COOK쓰레드를 기다리게 한다
				Thread.sleep(500);
			} catch (InterruptedException e) {
			}
		}

		dishes.add(dish);
		notify(); // 기다리고 있는 CUST를 깨우기 위함.
		System.out.println("Dishes:" + dishes.toString());
	}

	public void remove(String dishName) {
		synchronized (this) {

			String name = Thread.currentThread().getName();

			while (dishes.size() == 0) {
				System.out.println(name + " is wating");
				try {
					wait();
					Thread.sleep(500);
				} catch (InterruptedException e) {}
			}

			while (true) {
				for (int i = 0; i < dishes.size(); i++){
					if (dishName.equals(dishes.get(i))) {
						dishes.remove(i);
						notify();
						return;
					}
				} // for문 끝
				try{
					System.out.println(name+"is waiting.");
					wait();
					Thread.sleep(500);
				}catch (InterruptedException e) {}
			} // while(true)
		} // synchronized
	}

	public int dishNum() {
		return dishNames.length;
	}
}