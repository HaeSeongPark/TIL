package shape;

import java.util.Random;

public class Triangle extends Shape
{
	Point[] points;
	
	int sum = NOT_CALCULTAE;
	
	public Triangle() throws BadPointException
	{
		points = new Point[3];
		Random r = new Random();
		for(int i=0;  i<points.length; i++)
		{
			int x = r.nextInt(100);
			int y = r.nextInt(100);
			points[i] = new Point(x,y);
		}
		setBounds();
	}
	
	public Triangle(Point p1, Point p2, Point p3)
	{
		points = new Point[3];
		points[0] = p1;
		points[1] = p2;
		points[2] = p3;
		setBounds();
	}

	@Override
	public int calculateArea()
	{
		if(sum==NOT_CALCULTAE)
			sum = calculateBaseArea(points[0] , points[1] , points[2]);
		return sum;
	}

	@Override
	public void setBounds()
	{
		calculateArea();
	}
	
	@Override
	public String toString()
	{
		return "Type : Triangle, Point : " + points + " Area : " + calculateArea();
	}
}
