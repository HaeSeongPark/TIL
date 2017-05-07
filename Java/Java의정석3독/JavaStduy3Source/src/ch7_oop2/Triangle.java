package ch7_oop2;

class Triangle extends Shape {
	Point[] p = new Point[3];
	
	Triangle(Point[] p, String color){
		super(color);
		this.p = p;
	}
	
	void draw(){
		System.out.printf("[p1=%s, p2=%s, p3=%s, color=%s]%n",p[0].getXY(),p[1].getXY(),p[2].getXY(),color);
	}
}
