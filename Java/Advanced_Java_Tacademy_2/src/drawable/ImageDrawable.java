package drawable;

import java.io.PrintStream;
import annotation.Enemy;
import shape.Shape;

@Enemy
public class ImageDrawable extends AbstractDrawable
{

	Image image;
	
	public void setShape(Image image)
	{
		this.image = image;
	}
	
	@Override
	public void draw(PrintStream out)
	{
		out.println("Position : " + getXY());
		out.print("image" + image);
	}

	@Override
	public void onPositionChanged(int x, int y)
	{
		System.out.printf("%d,%d으로 위치 바뀜",x,y);
	}

}
