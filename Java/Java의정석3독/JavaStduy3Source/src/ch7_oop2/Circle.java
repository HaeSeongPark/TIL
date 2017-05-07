package ch7_oop2;

public class Circle extends Shape {
	Point center;
	int r;
	
	Circle(){
		this(new Point(0,0), 100, "white");
	}
	
	Circle(Point center, int r, String color){
		super(color);
		this.center = center;
		this.r = r;
	}
	
	void draw(){
		System.out.printf("[center=(%d, %d), r=%d, color=%s]%n",center.x,center.y, r, color);
	}

}
