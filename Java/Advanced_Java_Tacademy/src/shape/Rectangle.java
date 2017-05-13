package shape;

import java.util.Random;

public class Rectangle extends Shape
{
	int left, right, top, bottom;

	public Rectangle()
	{
		Random r = new Random();
		left = r.nextInt(50);
		right = 50 + r.nextInt(50);
		top = r.nextInt(50);
		bottom = 50 + r.nextInt(50);
		setBounds();
	}

	public Rectangle(int left, int right, int top, int bottom)
	{
		this.left = left;
		this.right = right;
		this.top = top;
		this.bottom = bottom;
		setBounds();
	}

	@Override
	public
	int calculateArea()
	{
		return Math.abs((right - left) * (bottom - top));
	}

	@Override
	protected void setBounds()
	{
		boundsLeft = left;
		boundsRight = right;
		boundsTop = top;
		boundsBottom = bottom;
	}

	@Override
	public String toString()
	{
		return "Type : Rectangle , left : " + left + ", top : " + top 
				+ ", right : " + right + ", bottom : " + bottom
				+ " Area : " + calculateArea();
	}
}
