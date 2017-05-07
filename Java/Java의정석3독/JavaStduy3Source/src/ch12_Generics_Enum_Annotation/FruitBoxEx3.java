package ch12_Generics_Enum_Annotation;

import java.util.*;

class Juice
{
	String name;

	Juice(String name)
	{
		this.name = name + "Juice";
	}

	@Override
	public String toString()
	{
		return name;
	}
}

class Juicer
{
	static Juice makeJuice(FruitBox<? extends Fruit> box)
	{
		String tmp = "";
		
		for(Fruit f : box.getList())
		{
			tmp += f + "";
		}
		
		return new Juice(tmp);
	}
}

public class FruitBoxEx3
{
	public static void main(String [] args)
	{
		FruitBox<Fruit> fruitBox = new FruitBox<Fruit>();
		FruitBox<Apple> appleBox = new FruitBox<Apple>();
		FruitBox<Grape> grapeBox = new FruitBox<Grape>();
		
		fruitBox.add(new Apple());
		fruitBox.add(new Grape());
		appleBox.add(new Apple());
		appleBox.add(new Apple());
		
		System.out.println(Juicer.makeJuice(fruitBox));
		System.out.println(Juicer.makeJuice(appleBox));
	}
}
