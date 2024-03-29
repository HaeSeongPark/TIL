package shape;

import java.io.Serializable;

public class Point implements Serializable
{
	private int x;
	private int y;
	
	Point(int x, int y) throws BadPointException
	{
		if ( x < 0 || y < 0)
			throw new BadPointException();

		this.x = x;
		this.y = y;
	}

	public int getX()
	{
		return x;
	}

	public int getY()
	{
		return y;
	}
	
	
}
