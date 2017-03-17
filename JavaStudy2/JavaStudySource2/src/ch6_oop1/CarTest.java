package ch6_oop1;

class Car{
	String color;
	String gearType;
	int door;
	
	Car() {
		this("white","auto",4);
	}
	
	Car(String color){
		this(color,"auto",4);
	}
	
	Car(String color, String gearType, int door){
		this.color = color;
		this.gearType = gearType;
		this.door = door;
	}
	
	Car(Car c){
		this(c.color,c.gearType,c.door);
	}
}

public class CarTest {
	public static void main(String[] args) {
		Car c1 = new Car();
		c1.color = "white";
		c1.gearType = "auto";
		c1.door = 4;
		
		Car c2 = new Car("while","auto",4);
		
		System.out.println("c1ÀÇ color="+c1.color + ", gearType=" + c1.gearType + ", door="+c1.door);
		System.out.println("c2ÀÇ color="+c2.color + ", gearType=" + c2.gearType + ", door="+c2.door);
	}
}
