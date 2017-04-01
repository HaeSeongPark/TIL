package ch12Exercise;

class Box3<T extends Fruit>{
	T item;
	void setItem(T item){this.item = item;}
	T getItem() {return item;}
}

class Fruit{}
class Apple extends Fruit{}
public class Ch12_3 {

	public static void main(String[] args) {
//		Box3<?>      b = new Box3();    
		// ok. Box<?>는 Box<? extends Object>, 객체 생성에 지네릭 타입을 지정해 주지 않았지만 문제가 없다.
		// new Box3() 대신 new Box3<>()를 사용하는 것이 좋다.
		
//		Box3<?>      b2 = new Box3<>(); 
		// Ok. Box<?> b = new Box<Fruit>();와 동일
		
//		Box3<?>      b3 = new Box3<Object>();  
		// 에러. Object는 Furit의 자식이 아니기 때문
		
		
//		Box3<Object> b4 = new Box3<Fruit>();
		// 에러. 타입불일치
		
//		Box3         b5 = new Box3<Fruit>();
		// ok. 그러나 Box3<?> b으로 써야 바람직함
		
//		Box3<? extends Fruit>  b6 = new Box3<Apple>(); 
		// ok
		
//		Box3<? extends Object> b7 = new Box3<? extends Fruit>();
		// new연산자에는 와일드 카드 사용 안됨
	}

}
