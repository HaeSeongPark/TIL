package ch12Exercise;

//class Juicer{
//	static <T extends Fruit> String makeJuice(FruitBox<T> box){
//		String tmp = "";
//		for(Fruit f : box.getList()) tmp += f + " ";
//		return tmp;
//	}
//}

public class Ch12_2 {

	public static void main(String[] args) {
			// Apple과 Grape는 Fruit의 자손
//			Juicer.<Apple>makeJuice(new FruitBox<Fruit>());  // 에러 타입불일치
//			Juicer.<Fruit>makeJuice(new FruitBox<Grape>());  // 에러 타입불일치
//			Juicer.<Fruit>makeJuice(new FruitBox<Fruit>());  // 가능 타입일치
//			Juicer.makeJuice(new FruitBox<Apple>());         // 가능 , Juicer.<Apple>makeJuice(new FruitBox<Apple>());
//			Juicer.makeJuice(new FruitBox<Object>());		 // 에러. T에는 Fruit의 자손만 올 수 있으므로 하고싶으면 super
	}

}
