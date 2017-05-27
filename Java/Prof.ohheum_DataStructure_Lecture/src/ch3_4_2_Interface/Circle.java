package ch3_4_2_Interface;

public class Circle extends Shape
{
	private int r;
	
	public Circle(int r)
	{
		super("Circle");
		this.r = r;
	}
	
	

	public int getR()
	{
		return r;
	}

	public void setR(int r)
	{
		this.r = r;
	}

	@Override
	double computeArea()
	{
		return Math.PI * r * r;
	}

	@Override
	double computePerimeter()
	{
		return 2 * Math.PI * r;
	}
	
	@Override
	public String toString()
	{
		return "Circle radius is " + r;
	}

}
