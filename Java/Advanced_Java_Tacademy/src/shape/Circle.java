package shape;

import java.util.Random;

public class Circle extends Shape
{
	Point center;
	int radius;

	public Circle() throws BadPointException
	{
		Random r = new Random();
		int x = 20 + r.nextInt(30);
		int y = 20 + r.nextInt(30);
		center = new Point(x , y);
		int min = Math.max(x , y);
		radius = 20 + r.nextInt(min - 20);
		setBounds();
	}

	public Circle(Point center, int radius)
	{
		super();
		this.center = center;
		this.radius = radius;
		setBounds();
	}

	@Override
	int calculateArea()
	{
		return ( int ) (radius * radius * Math.PI);
	}

	@Override
	protected void setBounds()
	{
		boundsLeft = center.getX() - radius;
		boundsRight = center.getX() + radius;
		boundsTop = center.getY() - radius;
		boundsBottom = center.getX() + radius;
	}

	@Override
	public String toString()
	{
		return "Type : Circle, radius : " + radius + 
				" center : [" + center.getX() + "," + center.getY() + "]";
	}

}
