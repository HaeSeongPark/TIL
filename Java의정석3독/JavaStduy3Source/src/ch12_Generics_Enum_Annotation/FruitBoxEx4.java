package ch12_Generics_Enum_Annotation;

import java.util.Collections;
import java.util.Comparator;


class FruitComp implements Comparator<Fruit>
{
	@Override
	public int compare(Fruit o1, Fruit o2)
	{
		return o1.weigth - o2.weigth;
	}
}

public class FruitBoxEx4
{
	public static void main(String [] args)
	{
		FruitBox<Apple> appleBox = new FruitBox<Apple>();
		FruitBox<Grape> grapeBox = new FruitBox<>();		
		appleBox.add(new Apple("GreenApple",300));
		appleBox.add(new Apple("GreenApple",100));
		appleBox.add(new Apple("GreenApple",200));
		
		grapeBox.add(new Grape("GreenGrape",400));
		grapeBox.add(new Grape("GreenGrape",300));
		grapeBox.add(new Grape("GreenGrape",200));
		
		Collections.sort(appleBox.getList(),new FruitComp());
		Collections.sort(grapeBox.getList(),new FruitComp());
		
		System.out.println(appleBox);
		System.out.println(grapeBox);
	}
}
