package ch9_Exercise;

public class ch9_2 {
	public static void main(String[] args) {
		Point3D p1 = new Point3D(1,2,3);
		Point3D p2 = new Point3D(1,2,3);
		
		System.out.println(p1);
		System.out.println(p2);
		System.out.println("p1==p2 ? " + (p1==p2) );
		System.out.println("p1.equals(p2) ? " + (p1.equals(p2)));
	}
}

class Point3D{
	int x,y,z;

	public Point3D(int x, int y, int z) {
		super();
		this.x = x;
		this.y = y;
		this.z = z;
	}

	public Point3D() {
		super();
	}
	
	public boolean equals(Object obj){
		if ( obj instanceof Point3D){
			Point3D tmp = (Point3D)obj;
			return ( x==tmp.x && y==tmp.y && z==tmp.z );
		}
		
		return false;
	}
	
	public String toString(){
//		String s = String.format("[ %d, %d, %d ]", x,y,z);
//		return "[" + x + "," + y + "," + z +"]";
		return String.format("[ %d, %d, %d ]", x,y,z);
	}
	
}