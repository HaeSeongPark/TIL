package shape;

import java.util.Random;

public class Polygon extends Shape
{
	Point[] points;
	private int sum = NOT_CALCULTAE;
	
	public Polygon() throws BadPointException
	{
		Random r = new Random();
		int type = 5 + r.nextInt(15);  // 5~19
		points = new Point[type];
		int radius = r.nextInt(50)+1; // 1~50
		double delta = 360.0 / type;
		for( int i=0; i<type; i++)
		{
			int x = 50 + (int)(radius*Math.cos(delta*i));
			int y = 50 + (int)(radius*Math.sin(delta*i));
			points[i] = new Point(x,y);
		}
		setBounds();
	}
	
	public Polygon(Point...points)
	{
		this.points = points;
		setBounds();
	}
	
	@Override
	public int calculateArea()
	{
		if(sum==NOT_CALCULTAE)
		{
			sum = 0;
			for(int i=1; i<points.length-1; i++)
				sum+=calculateBaseArea(points[0] , points[i] , points[i+1]);
		}
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
		return String.format("Type : %d Polygon, "
				+ "Points : %s, Area : %d" , points.length, points, calculateArea());
	}

}
