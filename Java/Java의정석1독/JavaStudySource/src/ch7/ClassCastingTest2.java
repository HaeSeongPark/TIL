package ch7;

public class ClassCastingTest2 {
	public static void main(String[] args) {
		Car car = new Car();
		Car car2 = null;
		FireEngine fe = null;
		
		car.drive();
		fe = (FireEngine)car; 
		// 에러, 참조 변수 car가 참조하고 있는 인스턴스가 Car타입
		// 조상타입의 인스턴스를 자손타입의 참조변수로 참조한느 것은 허용되지 않는다.
		// Car car = new FireEngine(); 이라고 하면 에러가 안 난다.
		fe.drive();
		car2 = fe;
		car2.drive();
	}
}
