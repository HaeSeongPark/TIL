package shape;

public class Main
{
	public static void main(String [] args) throws BadPointException
	{
		Shape[] shapes = new Shape[10];
		
		for(int i=0; i<shapes.length; i++)
		{
			try
			{
				shapes[i] = ShapeFactory.createShape();
			}
			catch ( BadPointException e )
			{
				shapes[i] = new Rectangle();
			}
		}
		
		for(int i=0; i<shapes.length; i++)
			System.out.println(shapes[i]);
	}
}
