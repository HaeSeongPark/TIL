package ch3_4_2_Interface;

public class Rectangle extends Shape
{
	private int width;
	private int height;

	public Rectangle(int width, int height)
	{
		super("Rectangle");
		this.width = width;
		this.height = height;
	}

	@Override
	double computeArea()
	{
		return width * height;
	}

	@Override
	double computePerimeter()
	{
		return 2 * ( width + height);
	}
	
	@Override
	public String toString()
	{
		return String.format("Rectangle : width : %d, height : %d " , width, height);
	}

	public int getWidth()
	{
		return width;
	}

	public int getHeight()
	{
		return height;
	}
}
