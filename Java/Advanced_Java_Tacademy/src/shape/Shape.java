package shape;

public abstract class Shape
{
	public static final int NOT_CALCULATE = -1;

	protected int boundsLeft = Integer.MAX_VALUE;
	protected int boundsTop = Integer.MAX_VALUE;
	protected int boundsRight = Integer.MIN_VALUE;
	protected int boundsBottom = Integer.MIN_VALUE;

	// 도형의 넓이
	abstract int calculateArea();

	// 도형의 영역을 나타내는 함수로 left, right, top, bottom값을 갖ㄴ느다.
	abstract protected void setBounds();

	// getters
	public int getBoundsLeft()
	{
		return boundsLeft;
	}

	public int getBoundsTop()
	{
		return boundsTop;
	}

	public int getBoundsRight()
	{
		return boundsRight;
	}

	public int getBoundsBottom()
	{
		return boundsBottom;
	}

	protected int calculateBaseArea(Point p1, Point p2, Point p3)
	{
		int minX = Math.min(Math.min(p1.getX() , p2.getX()) , p3.getX());
		boundsLeft = Math.min(minX , boundsLeft);

		int maxX = Math.max(Math.max(p1.getX() , p2.getX()) , p3.getX());
		boundsRight = Math.max(maxX , boundsRight);

		int minY = Math.min(Math.min(p1.getY() , p2.getY()) , p3.getY());
		boundsTop = Math.min(minY , boundsTop);

		int maxY = Math.max(Math.max(p1.getY() , p2.getY()) , p3.getY());
		boundsBottom = Math.max(maxY , boundsBottom);

		int rectArea = (maxX - minX) * (maxY - minY);
		int p1p2Area = Math.abs((p2.getX() - p1.getX()) * (p2.getX() - p1.getY()) / 2);
		int p1p3Area = Math.abs((p3.getX() - p1.getX()) * (p3.getX() - p1.getY()) / 2);
		int p2p3Area = Math.abs((p3.getX() - p2.getX()) * (p3.getX() - p2.getY()) / 2);

		return (rectArea - p1p2Area - p1p3Area - p2p3Area);
	}
}
