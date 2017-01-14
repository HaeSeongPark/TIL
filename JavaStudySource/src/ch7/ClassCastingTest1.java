package ch7;

public class ClassCastingTest1 {
	public static void main(String[] args) {
		Car car = null;
		FireEngine fe = new FireEngine();
		FireEngine fe2 = null;
		
		fe.water();
		car = fe; // car = (Car)fe;���� ����ȯ�� ������ ����
//		car.water(); // �����Ͽ���, CarŸ���� ���������δ� water()�� ȣ���� �� ����.
		fe2 = (FireEngine)car; //�ڼ�Ÿ�� <- ����Ÿ��
		fe2.water();
		
		
	}

}
class Car{
	String color;
	int door;
	
	void drive(){
		System.out.println("drive, Brrr~");
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