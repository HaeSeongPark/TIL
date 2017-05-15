package drawable;

import java.io.PrintStream;

public interface Drawable
{
	public abstract void draw(PrintStream out);
	public abstract void setPosition(int x, int y);
	public abstract void incPosition();
	public abstract void onPositionChanged(int x, int y);
}
