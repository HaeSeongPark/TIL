package ch13;

import java.util.ArrayList;

public class ThreadWaitEx2 {
	public static void main(String[] args) throws Exception{
		Table2 Table2 = new Table2();
		
		new Thread(new Cook2(Table2),"Cook21").start();
		new Thread(new Customer2(Table2,"donut"),"CUST1").start();
		new Thread(new Customer2(Table2,"burger"),"CUST2").start();
	}
}
class Customer2 implements Runnable{
	private Table2 Table2;
	private String food;
	
	Customer2(Table2 Table2, String food){
		this.Table2 = Table2;
		this.food = food;
	}
	public void run(){
		while(true){
			try{Thread.sleep(10);} catch(InterruptedException e){}
			String name = Thread.currentThread().getName();
			
			if(eatFood())
				System.out.println(name + " ate a " + food);
			else
				System.out.println(name + " failed to eat. : (");
		}
	}
	boolean eatFood(){return Table2.remove(food);}
}

class Cook2 implements Runnable{
	private Table2 Table2;
	
	Cook2(Table2 Table2){this.Table2 = Table2;}
	
	public void run(){
		while(true){
			int idx = (int)(Math.random()*Table2.dishNum());
			Table2.add(Table2.dishNames[idx]);
			try{Thread.sleep(1);} catch(InterruptedException e){}
		}
	}
}

class Table2{
	String[] dishNames = {"donut","donut","burger"};
	final int MAX_FOOD = 6;
	
	private ArrayList<String> dishes = new ArrayList<>();
	
	public synchronized void add(String dish){
		//테이블에 음식이 가득찼으면, 테이블에 음식을 추가하지 않는다.
		if(dishes.size() >= MAX_FOOD)
			return;
		dishes.add(dish);
		System.out.println("Dishes:"+dishes.toString());
	}
	public boolean remove(String dishName){
		synchronized(this){
			while(dishes.size()==0){
				String name = Thread.currentThread().getName();
				System.out.println(name+" is wating");
				try{Thread.sleep(500);} catch(InterruptedException e){}
			}
		
		
		//지정된 요리와 일치하는 요리를 테이블에서 제거한다.
		for(int i=0; i<dishes.size(); i++)
			if(dishName.equals(dishes.get(i))){
				dishes.remove(i);
				return true;
			}
		}
		return false;
	}
	public int dishNum() {return dishNames.length;}
}