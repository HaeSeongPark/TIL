package ch_12_Generics_Enum_Annotation;

import java.util.*;

interface Eatable{}

class Fruit2 implements Eatable{
	public String toString() { return "Furit2";}
}

class Apple2 extends Fruit2 { public String toString() { return "Apple2";}}
class Grape2 extends Fruit2 { public String toString() { return "Grape2";}}
class Toy2 { public String toString() { return "Toy2";}}


public class FruitBoxEx2 {
	public static void main(String[] args) {
		FruitBox2<Fruit2> fruitBox2 = new FruitBox2<Fruit2>();
		FruitBox2<Apple2> appleBox2 = new FruitBox2<Apple2>();
		FruitBox2<Grape2> grapeBox2 = new FruitBox2<Grape2>();
//		FruitBox2<Grape2> grapebox = new FruitBox2<Toy2>(); // 에러. 타입 불일치
//		FruitBox2<Toy2> toyBox = new FruitBox2<Toy2>(); // 에러.
		
		fruitBox2.add(new Fruit2());
		fruitBox2.add(new Apple2());
		fruitBox2.add(new Grape2());
		appleBox2.add(new Apple2());
//		appleBox.add(new Grape2()); // 에러. Grape2는 Apple의 자손이 아님 
		grapeBox2.add(new Grape2());
		
		System.out.println("fruitBox-"+fruitBox2);
		System.out.println("appleBox-"+appleBox2);
		System.out.println("grapebox-"+grapeBox2);
	}
}

class FruitBox2<T extends Fruit2&Eatable> extends Box2<T>{}


class Box2<T>{
	ArrayList<T> list = new ArrayList<T>();
	void add(T item) { list.add(item);}
	T get(int i) { return list.get(i); }
	int size () { return list.size(); }
	public String toString() { return list.toString(); }
	
}