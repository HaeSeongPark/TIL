package shape;

import java.util.Random;

public class Rectangle extends Shape
{
	Point[] points;
	
	public Rectangle() throws BadPointException
	{
		points = new Point[4];
		Random r = new Random();
		for(int i=0; i<points.length; i++)
		{
			int x = r.nextInt(100);
			int y = r.nextInt(100);
			points[i] = new Point(x,y);
		}
		setBounds();
	}
	
	public Rectangle(Point p1, Point p2, Point p3, Point p4)
	{
		points = new Point[4];
		points[0] = p1;
		points[1] = p2;
		points[2] = p3;
		points[3] = p4;
		setBounds();
	}


	@Override
	public int calculateArea()
	{
		int minX = Math.min(Math.min(points[0].getX() , points[1].getX())
				, Math.min(points[2].getX() , points[3].getX()));
		boundsLeft = Math.min(boundsLeft , minX);
		
		int maxX = Math.max(Math.max(points[0].getX() , points[1].getX())
				, Math.max(points[2].getX() , points[3].getX()));
		boundsRight = Math.max(boundsRight , minX);
		
		int minY = Math.min(Math.min(points[0].getY() , points[1].getY())
				, Math.min(points[2].getY() , points[3].getY()));
		boundsTop = Math.min(boundsTop , minY);
		
		int maxY = Math.max(Math.max(points[0].getY() , points[1].getY())
				, Math.max(points[2].getY() , points[3].getY()));
		boundsBottom = Math.max(boundsBottom , maxY);
		
		return Math.abs((maxX-minX) * (maxY-minY));
	}
	
	@Override
	public void setBounds()
	{
		calculateArea();

	}
	
	@Override
	public String toString()
	{
		return "Type : Rectangle ," + " points " + points
				+ " Area : " + calculateArea();
	}
}
