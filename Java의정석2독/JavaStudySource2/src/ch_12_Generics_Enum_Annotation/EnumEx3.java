package ch_12_Generics_Enum_Annotation;

enum Transportation {
	BUS(100) { int fare(int distance) { return distance*BASIC_FARE;}},
	TRAIN(150) { int fare(int distance) { return distance*BASIC_FARE;}},
	SHIP(100) { int fare(int distance) { return distance*BASIC_FARE;}},
	AIRPLANE(300) { int fare(int distance) { return distance*BASIC_FARE;}};
	
	protected final int BASIC_FARE; // protected로 해야 각 상수에서 접근가능
	
	Transportation(int basicFare){
		BASIC_FARE = basicFare;
	}
	
	public int getBasicFare() { return BASIC_FARE; }
	
	// 추상 메서드 fare()를 똑같은 내용으로 구현했지만, 다르게
	// 구현될 수도 있게 하려고 추상 메서드로 선언한 것
	
	abstract int fare(int distance); // 거리에 따른 요금 계산
}

public class EnumEx3 {
	public static void main(String[] args) {
		System.out.println("bus fare = " +Transportation.BUS.fare(100));
		System.out.println("train fare = " +Transportation.TRAIN.fare(100));
		System.out.println("ship fare = " +Transportation.SHIP.fare(100));
		System.out.println("airplane fare = " +Transportation.AIRPLANE.fare(100));
	}
}
