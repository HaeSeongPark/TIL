package ch7_oop2;

public class DrawShape {
	public static void main(String[] args) {
		Point[] p = { new Point(100, 100),
					  new Point(140, 50 ),
					  new Point(200, 100)
		};
		
		Triangle t = new Triangle(p,"green");
		Circle c = new Circle(new Point(150, 150), 50,"red");
		Circle c2 = new Circle();
		
		t.draw();
		c.draw();
		c2.draw();
		
		
	}
}

class Shape{
	String color = "";
	void draw(){
		System.out.printf("[color=%s]%n",color);
	}
	Shape(String color){
		this.color = color;
	}
}

class Point{
	int x;
	int y;
	
	Point(){
		this(0,0);
	}
	
	Point(int x, int y){
		this.x = x;
		this.y = y;
	}
	
	String getXY(){
		return "{"+x+","+y+")";
	}
}

class Circle extends Shape{
	Point center;
	int r;
	Circle(){
		this(new Point(0,0),100, "white");
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

class Triangle extends Shape{
	Point[] p = new Point[3];
	
	Triangle(Point[] p,String color){
		super(color);
		this.p = p;
	}
	
	void draw(){
		System.out.printf("[p1=%s, p2=%s, p3=%s, color=%s]%n",p[0].getXY(),p[1].getXY(),p[2].getXY(),color);
	}
}