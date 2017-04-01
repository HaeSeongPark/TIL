package ch7_oop2;

public class CastingTest1 {
	public static void main(String[] args) {
		Car car = null;
		FireEngine fe = new FireEngine();
		FireEngine fe2 = null;
		
		fe.water();
		car = fe; // car = (Car)fe;
//		car.water();
		fe2 = (FireEngine)car;
		fe.water();
	}
}

class Car{
	String color;
	int door;
	
	void drive(){
		System.out.println("dirve, Brrr~");
	}
	
	void stop(){
		System.out.println("stop!!!");
	}
}

class FireEngine extends Car{
	void water(){
		System.out.println("water!!!");
	}
}