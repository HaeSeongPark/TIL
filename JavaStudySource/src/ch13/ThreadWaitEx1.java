package ch13;

import java.util.ArrayList;

public class ThreadWaitEx1 {
	public static void main(String[] args)throws Exception{
		Table table = new Table();
		
		new Thread(new Cook(table),"COOK1").start();
		new Thread(new Customer(table,"donut"),"CUST1").start();
		new Thread(new Customer(table,"burger"),"CUST2").start();
	}
}
class Customer implements Runnable{
	private Table table;
	private String food;
	
	Customer(Table table, String food){
		this.table = table;
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
	boolean eatFood(){return table.remove(food);}
}

class Cook implements Runnable{
	private Table table;
	
	Cook(Table table){this.table = table;}
	
	public void run(){
		while(true){
			int idx = (int)(Math.random()*table.dishNum());
			table.add(table.dishNames[idx]);
			try{Thread.sleep(1);} catch(InterruptedException e){}
		}
	}
}

class Table{
	String[] dishNames = {"donut","donut","burger"};
	final int MAX_FOOD = 6;
	
	private ArrayList<String> dishes = new ArrayList<>();
	
	public void add(String dish){
		//테이블에 음식이 가득찼으면, 테이블에 음식을 추가하지 않는다.
		if(dishes.size() >= MAX_FOOD)
			return;
		dishes.add(dish);
		System.out.println("Dishes:"+dishes.toString());
	}
	public boolean remove(String dishName){
		//지정된 요리와 일치하는 요리를 테이블에서 제거한다.
		for(int i=0; i<dishes.size(); i++)
			if(dishName.equals(dishes.get(i))){
				dishes.remove(i);
				return true;
			}
		return false;
	}
	public int dishNum() {return dishNames.length;}
}