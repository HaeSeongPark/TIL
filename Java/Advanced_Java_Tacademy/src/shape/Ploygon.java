package shape;

import java.util.Random;

public class Ploygon extends Shape
{
	Point [] points;
	private int sum = NOT_CALCULATE;

	public Ploygon() throws BadPointException
	{
		Random r = new Random();
		int type = 5 + r.nextInt(15);
		points = new Point [type];
		int radius = r.nextInt(50);
		double delta = 360.0 / type;
		for ( int i = 0; i < type; i++ )
		{
			int x = 50 + ( int ) (radius * Math.cos(delta * i));
			int y = 50 + ( int ) (radius * Math.sin(delta * i));
			points[i] = new Point(x , y);
		}
		setBounds();
	}

	public Ploygon(Point...points)
	{
		this.points = points;
		setBounds();
	}

	@Override
	int calculateArea()
	{
		if ( sum == NOT_CALCULATE )
		{
			sum = 0;
			for ( int i = 1; i < points.length - 1; i++ )
			{
				sum += calculateBaseArea(points[0] , points[i] , points[i + 1]);
			}
		}
		return sum;
	}

	@Override
	protected void setBounds()
	{
		calculateArea();
	}

	@Override
	public String toString()
	{
		return "Type : " + points.length + " Polygon , Points : " + points;
	}

}
