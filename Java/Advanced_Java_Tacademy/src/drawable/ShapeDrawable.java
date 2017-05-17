package drawable;

import java.io.PrintStream;
import annotation.Friend;
import shape.Shape;

@Friend
public class ShapeDrawable extends AbstractDrawable
{
	Shape s;

	public void setShape(Shape s)
	{
		this.s = s;
	}
	
	@Override
	public void draw(PrintStream out)
	{
		out.println("position : " + x + "," + y);
		out.println("Shape : " + s);
	}

	@Override
	public void onPositionChanged(int x, int y)
	{
		System.out.println(" ShapeDrawable PositonChanged " + "x : " + x + " ,y : " + y);
	}

}
