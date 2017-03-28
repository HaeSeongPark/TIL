package ch9_lang;

//class Point{
//	int x, y;
//	
//	Point(int x, int y){
//		this.x = x;
//		this.y = y;
//	}
//	
//	public String toString(){
//		return "(" + x + ", " + y + ")";
//	}
//}

class Circle implements Cloneable{
	Point p;
	double r;
	
	Circle(Point p, double r){
		this.p = p;
		this.r = r;
	}
	
	public Circle shallowCopy(){
		Object obj = null;
		
		try {
			obj = super.clone();
		} catch (CloneNotSupportedException e) {
			// TODO Auto-generated catch block
		}
		
		return (Circle)obj;
	}
	
	public Circle deepCopy(){
		Object obj = null;
		
		try {
			obj = super.clone();
		} catch (CloneNotSupportedException e) {
			// TODO Auto-generated catch block
		}
		
		Circle c = (Circle)obj;
		c.p = new Point(this.p.x, this.p.y);
		
		return c;
	}
	
	public String toString(){
		return "[p=" + p + ", r=" + r + "]";
	}
}

public class ShallowDeepCopy {
	public static void main(String[] args) {
		Circle c1 = new Circle(new Point(1,1), 20);
		Circle c2 = c1.shallowCopy();
		Circle c3 = c1.deepCopy();
		
		System.out.println(c1);
		System.out.println(c2);
		System.out.println(c3);
		
		c1.p.x = 9;
		c1.p.y = 9;
		
		System.out.println(c1);
		System.out.println(c2);
		System.out.println(c3);
		
	}
}
