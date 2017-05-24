package ch2_2_PolyPoint;

public class OrthoLine
{
	Point p1;
	Point p2;
	public OrthoLine(Point p1, Point p2)
	{
		this.p1 = p1;
		this.p2 = p2;
		
		if(p1.x > p2.x || p1.x==p2.x && p1.y > p2.y)
			swap();
	}
	private void swap()
	{
		Point tmp = p1;
		p1 = p2;
		p2 = tmp;
	}
	
	public boolean isVertical()
	{
		return p1.x == p2.x;
	}
	
	public boolean intersects(OrthoLine other)
	{
		if(isVertical() && !other.isVertical())
		{
			return (other.p1.x < p1.x && other.p2.x > p1.x) && (p1.y < other.p1.y && p2.y > other.p1.y);
		}
		else if(!isVertical() && other.isVertical())
		{
			return (other.p1.y < p1.y && other.p2.y > p1.y) && (p1.x < other.p1.x && p2.x > other.p1.x);
		}
		else
			return false;
	}
}
