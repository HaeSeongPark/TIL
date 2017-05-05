package ch12_Generics_Enum_Annotation;

import java.util.*;

public class FruitBoxEx2
{
	public static void main(String [] args)
	{
		FruitBox<Fruit> fruitBox = new FruitBox<Fruit>();
		FruitBox<Apple> appleBox = new FruitBox<Apple>();
		FruitBox<Grape> grapeBox = new FruitBox<Grape>();
		// FruitBox2<Grape2> grapebox = new FruitBox2<Toy2>(); // 에러. 타입 불일치
		// FruitBox2<Toy2> toyBox = new FruitBox2<Toy2>(); // toy는 안 됨 <T
		// extends Fruit & Eatable>으로 제한
		// toy클래스는 Fruit도 상속받지 않았고 Eatable도 구현하지 않았음

		fruitBox.add(new Fruit());
		fruitBox.add(new Apple());
		fruitBox.add(new Grape());
		appleBox.add(new Apple());
		// appleBox.add(new Grape()); // 에러. Grape2는 Apple의 자손이 아님
		grapeBox.add(new Grape());

		System.out.println("fruitBox-" + fruitBox);
		System.out.println("appleBox-" + appleBox);
		System.out.println("grapebox-" + grapeBox);
	}
}
