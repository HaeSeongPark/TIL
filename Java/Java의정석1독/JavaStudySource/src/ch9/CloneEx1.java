package ch9;

//class Point implements Cloneable{
//	int x;
//	int y;
//	Point(int x, int y){
//		this.x = x;
//		this.y = y;
//	}
//	public String toString(){
//		return "x="+x+", y="+y;
//	}
//	public Object clone(){
//		Object obj = null;
//		
//		try {
//			obj = super.clone();
//		} catch (CloneNotSupportedException e) {
//			e.printStackTrace();
//		}
//		
//		return obj;
//	}
//}

class Point implements Cloneable {
	int x;
	int y;

	Point(int x, int y) {
		this.x = x;
		this.y = y;
	}

	public String toString() {
		return "x=" + x + ", y=" + y;
	}

	public Point clone() {
		Object obj = null;

		try {
			obj = super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}

		return (Point)obj;
	}
}

public class CloneEx1 {
	public static void main(String[] args) {
		Point original = new Point(3, 5);
//		Point copy = (Point) original.clone();
		Point copy = original.clone();
		System.out.println(original);
		System.out.println(copy);
	}
}
