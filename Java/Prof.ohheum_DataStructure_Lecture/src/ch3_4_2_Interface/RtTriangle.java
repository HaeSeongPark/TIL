package ch3_4_2_Interface;

public class RtTriangle extends Shape
{
	private int width;
	private int height;
	
	public RtTriangle(int width, int height)
	{
		super("RtTriangle");
		this.width = width;
		this.height = height;
	}

	@Override
	double computeArea()
	{
		return width * height / 2;
	}

	@Override
	double computePerimeter()
	{	double hypotenuse = Math.sqrt( (width * width) + (height * height));
		return width + height + hypotenuse;  // + ºøº¯
	}
	
	@Override
	public String toString()
	{
		return String.format("RtTriangle : width : %d, height : %d " , width, height);
	}
}
