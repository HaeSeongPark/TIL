package semina;

public class Point3D extends Point
{
	public int z;

	public Point3D(int x, int y, int z)
	{
		super(x, y);
		this.z = z;
	}

	public Point3D()
	{
		this(1,1,1);
	}
	
	@Override
	public String toString()
	{
		return String.format("x : %d, y : %d, z : %d" , x , y, z);
	}

	
}
