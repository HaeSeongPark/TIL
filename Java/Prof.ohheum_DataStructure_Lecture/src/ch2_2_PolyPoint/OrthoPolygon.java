package ch2_2_PolyPoint;

public class OrthoPolygon
{
	public int n = 0;
	public Point[] verticles;
	public OrthoPolygon(int k)
	{
		verticles = new Point[k];
	}
	public void addVertex(int x, int y)
	{
		verticles[n++] = new Point(x,y);
	}
	public int maxX()
	{
		int max = verticles[0].x;
		for(int i=1; i<n; i++)
		{
			if(verticles[i].x > max)
				max = verticles[i].x;
		}
		return max;
	}
	
	public boolean contains(Point p)
	{
		OrthoLine arrow = new OrthoLine(p, new Point(maxX()+1,p.y));
		int count = 0;
		for(int i=0; i<n; i++)
		{
			OrthoLine edge = new OrthoLine(verticles[i] , verticles[(i+1)%n]);
			if(edge.intersects(arrow))
				count++;
		}
		return count%2 == 1;
	}
}
