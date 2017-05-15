package drawable;

import java.io.PrintStream;

public abstract class AbstractDrawable implements Drawable
{
	protected int x;
	protected int y;
	protected OnDrawableListener mlistener;
	
	public void setOnDrawableChangeListner(OnDrawableListener listener)
	{
		mlistener = listener;
	}
	
	@Override
	public void setPosition(int x, int y)
	{
		if( x<0 && y<0 ) throw new BadPositionException();
		this.x = x;
		this.y = y;
		
		onPositionChanged(x , y);
		
		if(mlistener != null)
			mlistener.onDrawableChanged(this);
	}

	@Override
	public void incPosition()
	{
		setPosition(x+5 , y+5);
	}
	
	public String getXY()
	{
		return String.format(", x : %d, y : %d" , x, y);
	}
}
