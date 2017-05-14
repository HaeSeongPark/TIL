package shape;

import java.util.Random;

public class ShapeFactory
{
	enum Shapes
	{
		TRIANGLE, RECTANGLE, POLYGON, CIRCLE;
		
		public static Shapes getRandom()
		{
			return values()[new Random().nextInt(values().length)];
		}
	}
	
	static Random r = new Random();
	
	public static Shape createShape() throws BadPointException
	{
		Shapes shape = Shapes.getRandom();
		Shape s;
		switch ( shape )
		{
			case TRIANGLE :
				s = new Triangle();
				break;
			case RECTANGLE :
				s = new Rectangle();
				break;
			case POLYGON :
				s = new Polygon();
				break;
			case CIRCLE :
				s = new Circle();
				break;
			default :
				s = new Triangle();
				break;
		}
		
		return s;
	}
}
