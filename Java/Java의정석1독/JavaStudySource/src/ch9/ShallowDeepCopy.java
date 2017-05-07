package ch9;

class PointSD{
	int x;
	int y;
	
	PointSD(int x, int y){
		this.x=x;
		this.y=y;
	}
	public String toString(){
		return "("+x+", "+y+")";
	}
}

class Circle implements Cloneable{
	PointSD p;
	double r;
	
	Circle(PointSD p, double r){
		this.p = p;
		this.r = r;
	}
	public Circle shallowCopy(){
		Object obj = null;
		
		try {
			obj=super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return (Circle)obj;
	}
	public Circle deepCopy(){
		Object obj = null;
		
		try {
			obj=super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		Circle c = (Circle)obj;
		c.p = new PointSD(this.p.x, this.p.y);
		return c;
	}
	public String toString(){
		return "[p=" +p + ", r="+r+"]";
	}
}



public class ShallowDeepCopy {
	public static void main(String[] args) {
		Circle c1 = new Circle(new PointSD(1,1),2.0);
		Circle c2 = c1.shallowCopy();
		Circle c3 = c1.deepCopy();
		
		System.out.println("c1="+c1);
		System.out.println("c2="+c2);
		System.out.println("c3="+c3);
		
		c1.p.x = 9;
		c1.p.y = 9;

		System.out.println("º¯°æ ÈÄ");
		System.out.println("c1="+c1);
		System.out.println("c2="+c2);
		System.out.println("c3="+c3);
		
	}
}
