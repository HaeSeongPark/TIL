package ch3_4_2_Interface;

public abstract class Shape implements Comparable<Shape>
{
	String shapeName;
	
	public Shape(String shapeName)
	{
		this.shapeName = shapeName;
	}
	abstract double computeArea();
	abstract double computePerimeter();
	
	@Override
	public int compareTo(Shape o)
	{
		return (int)(computeArea() - o.computeArea());
	}
}
