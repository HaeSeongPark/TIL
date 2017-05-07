package ch7_oop2;
public class CastingTest2 {
	public static void main(String[] args) {
		Car car = new Car();
		Car car2 = null;
		FireEngine fe = null;
		
		car.drive();
//		fe = (FireEngine)car; 
		// 위 문장 실행시 에러.
		/* 참조변수(car)가 참조하고 있는 인스턴스가 Car타입의 인스턴스다
		 * 조상타입의 인스턴스를 자손타입의 참조변수로 참조하는 것은 허용되지 않는다.
		 */
		car = new FireEngine();
		fe = (FireEngine)car;
		
		fe.drive();
		car2 = fe;
		car2.drive();
	}
}
