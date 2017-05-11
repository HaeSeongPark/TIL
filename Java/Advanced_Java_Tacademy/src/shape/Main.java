package shape;


public class Main
{
	public static void main(String [] args)
	{
		Shape[] shapes = new Shape[100];
		
		for(int i=0; i<shapes.length; i++)
		{
			try
			{
				shapes[i] = ShapeFactory.createShape();
			}
			catch ( BadPointException e )
			{
				e.printStackTrace();
				shapes[i] = new Rectangle(10 , 10 , 90 , 90);
			}
		}
		
		for(int i=0; i<shapes.length; i++)
		{
			System.out.println(shapes[i]);
		}
	}
}
