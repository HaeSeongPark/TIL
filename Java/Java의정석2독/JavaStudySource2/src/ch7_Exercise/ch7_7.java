package ch7_Exercise;

class Parent{
	int x = 100;
	
	Parent(){
		this(200);
	}
	
	Parent(int x){
		this.x = x;
	}
	
	int getX(){
		return x;
	}
}

class Child extends Parent{
	int x = 3000;
	
	Child(){
		this(1000);
	}
	
	Child(int x){
		this.x = x;
	}
}
public class ch7_7 {
	public static void main(String[] args) {
		Child c = new Child();
		System.out.println("x="+c.getX());
//		Child() -> Child(int x) -> Parent() -> Parent(int x) -> Object()  / 1000
	}
}
