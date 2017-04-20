package ch_12_Generics_Enum_Annotation;

import java.util.*;

class Fruit4 {
	String name;
	int weigth;

	Fruit4(String name, int weigth) {
		this.name = name;
		this.weigth = weigth;
	}

	public String toString() {
		return name + "(" + weigth + ")";
	}
}

class Apple4 extends Fruit4 {
	Apple4(String name, int weigth) {
		super(name, weigth);
	}
}

class Grape4 extends Fruit4{
	Grape4(String name, int weigth) {
		super(name, weigth);
	}
}

class Fruit4Comp implements Comparator<Fruit4>{
	@Override
	public int compare(Fruit4 o1, Fruit4 o2) {
		return o1.weigth - o2.weigth;
	}
}

class FruitBox4<T extends Fruit4> extends Box4<T>{}
class Box4<T>{
	ArrayList <T> list = new ArrayList<>();
	void add(T item) { list.add(item); }
	T get(int i) { return list.get(i); }
	ArrayList<T> getList() { return list; }
	int size() { return list.size(); }
	public String toString() { return list.toString(); }
}

public class FruitBoxEx4 {
	public static void main(String[] args) {
		FruitBox4<Apple4> appleBox = new FruitBox4<Apple4>();
		FruitBox4<Grape4> grapeBox = new FruitBox4<>();		
		appleBox.add(new Apple4("GreenApple",300));
		appleBox.add(new Apple4("GreenApple",100));
		appleBox.add(new Apple4("GreenApple",200));
		
		grapeBox.add(new Grape4("GreenGrape",400));
		grapeBox.add(new Grape4("GreenGrape",300));
		grapeBox.add(new Grape4("GreenGrape",200));
		
		Collections.sort(appleBox.getList(),new Fruit4Comp());
		Collections.sort(grapeBox.getList(),new Fruit4Comp());
		
		System.out.println(appleBox);
		System.out.println(grapeBox);
	}
}
