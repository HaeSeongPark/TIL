package drawable;

import java.io.PrintStream;
import java.util.ArrayList;
import annotation.Enemy;

@Enemy
public class GroupDrawable<T extends Drawable> extends AbstractDrawable
{
	ArrayList<T> children = new ArrayList<>();
	
	public void addChild(T child)
	{
		children.add(child);
		repositionChildren();
	}
	
	private void repositionChildren()
	{
		for(int i=0, size=children.size(); i<size; i++)
		{
			T child = children.get(i);
			child.setPosition(x+i*10 , y+i*10);
		}
	}
	
	@Override
	public void setPosition(int x, int y)
	{
		super.setPosition(x, y);
		repositionChildren();
	}
	
	@Override
	public void draw(PrintStream out)
	{
		for(T d : children)
			d.draw(out);
	}

	@Override
	public void onPositionChanged(int x, int y)
	{
		// TODO Auto-generated method stub
		
	}

}
