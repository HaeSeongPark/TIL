package ch7;

class PointSC{
	int x;
	int y;
	
	PointSC(int x, int y){
		//super(); = Object();
		//생성자 첫 줄에서 다른 생성자를 호출하지 않기 때문에 컴파일러가 자동으로 삽입
		this.x = x;              
		this.y = x;
	}
	String getLocation(){
		return "x : " + x + ", y : " + y;
	}			
}

class Point3D extends PointSC{
	int z;
	Point3D(int x, int y, int z){
		super(x,y);
		this.z = z;
	}
	String getLocation(){
		return super.getLocation() + ",z : "+z;
	}	
}
public class SuperConstructor {
	public static void main(String[] args) {
		Point3D p3 = new Point3D(1,2,3);
		System.out.println("p3.x="+p3.x);
		System.out.println("p3.y="+p3.y);
		System.out.println("p3.z="+p3.z);
	}
}
