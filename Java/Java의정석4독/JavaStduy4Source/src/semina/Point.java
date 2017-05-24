package semina;

public class Point implements Comparable<Point>
{
	public int x;
	public int y;

	public Point()
	{
		this(1,1);
	}

	public Point(int x, int y)
	{
		this.x = x;
		this.y = y;
	}

	@Override
	public String toString()
	{
		return String.format("x : %d, y : %d" , x , y);
	}

	@Override
	public boolean equals(Object obj)
	{
		// 유효성 검사하고 바로 나가줘야 함
		// 아니면 if~else로 감싸줘야 해서 소스 depth가 깊어지고
		// 보기 힘들어짐.
		
		if(!(obj instanceof Point)) return false;
		
		Point p = (Point)obj;
		
		if(this.x == p.x && this.y == p.y) return true;
		
		return false;
		
//		if ( obj instanceof Point )
//		{
//			Point other = ( Point ) obj;
//			return x == other.x && y == other.y;
//		}
//		return false;
	}

	public double getDistance(Point p)
	{
		return getDistance(this, p);
	}
	
	public static double getDistance(Point p1, Point p2)
	{
//		if(p1==null || p2==null ) throw new NullPointerException();
		
		nullCheck(p1,p2);
		
		return Math.sqrt((p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y) * (p1.y - p2.y));
	}

	@Override
	public int compareTo(Point p)
	{
		nullCheck(p);
		int thisSum = x+y;
		int otherSum = p.x + p.y;
		return (thisSum < otherSum) ? -1 : (thisSum == otherSum) ? 0 : 1 ;
	}
	
	public static void nullCheck(Point...p)
	{
		for(int i=0; i<p.length; i++)
		{
			try
			{
				if(p[i] == null) throw new NullPointerException();
			}
			catch ( NullPointerException e )
			{
				System.out.println("null ㅜㅜ");
			}
		}
	}
}
