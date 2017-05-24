package semina;
import java.util.TreeSet;
import java.util.Vector;

public class PointTest
{
	public static void main(String [] args)
	{
		Point p1 = new Point(3, 5);
		Point p2 = new Point();
		System.out.println(p1);
		System.out.println(p2);
		
		TreeSet<Point> set = new TreeSet<>();
		set.add(p1);
		set.add(p2);
		
		System.out.println(set);
		
		System.out.println("p1==p2 : " +  p1.equals(p2));
		System.out.println("p1과 p2사이의 거리 : " + p1.getDistance(p2));
	}
}
