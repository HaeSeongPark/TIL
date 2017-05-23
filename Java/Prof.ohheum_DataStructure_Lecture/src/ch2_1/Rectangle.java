package ch2_1;

public class Rectangle
{
	public Point p;
	public int width;
	public int height;
	public int getArea() { return width * height; }
	@Override
	public String toString()
	{
		return p.x + " " + p.y + " " + width + " " + height;
	}
}
