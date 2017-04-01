package ch12;

import java.util.*;

interface Eatable{}

class Fruit2 implements Eatable{
	public String toString() {return "Fruit2";}
}

class Apple2 extends Fruit2{public String toString() {return "Apple";}}
class Grape2 extends Fruit2{public String toStirng() {return "Grape";}}
class Toy2				   {public String toString() {return "Toy";}}

public class FruitBoxEx2 {
	public static void main(String[] args) {
		FruitBox2<Fruit2> fruitBox = new FruitBox2<Fruit2>();
		FruitBox2<Apple2> appleBox = new FruitBox2<Apple2>();
		FruitBox2<Grape2> grapeBox = new FruitBox2<Grape2>();
//		FruitBox2<Grape2> grapeBox = new FruitBox2<Apple2>();  // 에러. 타입 불일치
//		FruitBox2<Toy>     toyBox   = new FruitBox2<Toy>();    // 에러. FruitBox2의 타입으로는 Fruit2와 Eatble을 상속과 구현한 클래스여야함
		
		fruitBox.add(new Fruit2());
		fruitBox.add(new Apple2());
		fruitBox.add(new Grape2());
		
		appleBox.add(new Apple2());
//		appleBox.add(new Grape2()); 에러. Grape는 Apple의 자손이 아님
		grapeBox.add(new Grape2());
		System.out.println("fruitBox-"+fruitBox);
		System.out.println("appleBox-"+appleBox);
		System.out.println("grapeBox-"+grapeBox);
	}
}

class FruitBox2<T extends Fruit2 & Eatable> extends Box<T>{}

class Box2<T>{
	ArrayList<T> list = new ArrayList<T>();
	void add(T item){list.add(item);}
	T get(int i) {return list.get(i);}
	int size() {return list.size();}
	public String toString() {return list.toString();}
}