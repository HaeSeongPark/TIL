package drawable;

import java.io.PrintStream;
import java.io.Serializable;

public abstract class AbstractDrawable implements Drawable, Serializable
{

	protected int x, y;

	protected OnDrawableChangeListener mlistener;

	public void setOnDrawableChangeListener(OnDrawableChangeListener listener)
	{
		mlistener = listener;
	}

	@Override
	public void incPosition()
	{
		setPosition(x+10 , y+10);
	}

	@Override
	public void setPosition(int x, int y)
	{
		if( x<0 || y<0) throw new BadPositionException();
		
		this.x = x;
		this.y = y;
		
		// has-a 관계에서 변경을 알려주는 방법
		if( mlistener != null) 
			mlistener.onDrawableChanged(this);
		
		// is-a 관계에서 변경을 알려주는 방법
		onPositionChanged(x , y);
	}
	
	public String getXY()
	{
		return ", x : " + x + ", y : " + y;
	}
}
