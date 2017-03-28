package ch9_lang;

class Point implements Cloneable{
	int x, y;
	Point(int x, int y){
		this.x = x;
		this.y = y;
	}
	public String toString(){
		return "x=" + x + ", y=" + y;
	}
//	public Object clone(){
//  공변환반환타입. 조상클래스의 반환타입을 자손클래스의 타입으로 변경할 수 있음
//	번거로운 형변환 생략가능
	public Point close(){  
		Object obj = null;
		try {
			obj = super.clone();
		} catch (CloneNotSupportedException e) {}
		
//		return obj;
		return (Point)obj;
	}
}

public class CloneEx1 {
	public static void main(String[] args) {
		Point original = new Point(3,5);
//		Point clone = (Point)original.clone();
		Point clone = original.close();
		System.out.println(original);
		System.out.println(clone);
	}
}
