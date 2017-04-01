package ch12Exercise;

class Box<T>{
	T item;
	
	void setItem(T item){this.item = item;}
	T getItem() { return item;}
	
}

public class Ch12_1 {

	public static void main(String[] args) {
//		Box<Object> b = new Box<Stirng>();   // 에러. 대입된 타입 일치해야함
//		Box<Object> b = (Object)new Box<String>();   //에러. OBject타입과 Box<Object>타입의불일치
//		new Box<String>().setItem(new Object()); // 에러. String이외의 타입은 지정불가
		new Box<String>().setItem("ABC");  // String타입임으로 가능
	}

}
