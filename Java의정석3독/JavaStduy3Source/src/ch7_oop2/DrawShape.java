package ch7_oop2;

public class DrawShape {
	public static void main(String[] args) {
		Point[] p = {
				new Point(100, 100),
				new Point(140, 50),
				new Point(200, 100)
		};
		
		Triangle t = new Triangle(p,"red");
		Circle c = new Circle(new Point(150, 150),50,"red");
		Circle c2 = new Circle();
		
		t.draw();
		c.draw();
		c2.draw();
	}
}
