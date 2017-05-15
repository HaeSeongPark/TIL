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
		out.println("Position : " + getXY());
		out.print("Shape : " + s);
	}

	@Override
	public void onPositionChanged(int x, int y)
	{
		System.out.printf("%d,%d으로 위치 바뀜",x,y);
	}

}
