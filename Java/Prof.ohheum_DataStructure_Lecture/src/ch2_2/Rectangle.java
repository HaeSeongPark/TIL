package ch2_2;

public class Rectangle
{
	public Point p;
	public int width;
	public int height;
	
	public int getArea() { return width * height; }
	
	public Rectangle(Point p, int width, int height)
	{
		this.p = p;
		this.width = width;
		this.height = height;
	}
	
	public Rectangle(int x, int y, int width, int height)
	{
		p = new Point(x,y);
		this.width = width;
		this.height = height;
	}
	
	@Override
	public String toString()
	{
		return p.x + " " + p.y + " " + width + " " + height;
	}
}
