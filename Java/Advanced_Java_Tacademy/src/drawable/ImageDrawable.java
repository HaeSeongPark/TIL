package drawable;

import java.io.PrintStream;
import annotation.Enemy;

@Enemy
public class ImageDrawable extends AbstractDrawable
{
	Image image;
	public void setImage(Image image)
	{
		this.image = image;
	}
	
	@Override
	public void draw(PrintStream out)
	{
		out.println("position : " + x + "," + y);
		out.println("image : " + image);
	}

	@Override
	public void onPositionChanged(int x, int y)
	{
		System.out.println("PositonChanged " + "x : " + x + " ,y : " + y);
	}
}
