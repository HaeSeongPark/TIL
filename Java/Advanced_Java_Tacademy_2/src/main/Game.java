package main;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Random;
import annotation.Enemy;
import annotation.Friend;
import drawable.AbstractDrawable;
import drawable.Drawable;
import drawable.OnDrawableListener;

public class Game
{
	ArrayList<Drawable> friendDrawable = new ArrayList<>();
	ArrayList<Drawable> enemyDrawable = new ArrayList<>();
	ArrayList<Drawable> allDrawable = new ArrayList<>();
	Random sR = new Random();
	DrawRunnable drawRunnable;

	OnDrawableListener listener = new OnDrawableListener()
	{
		@Override
		public void onDrawableChanged(Drawable d)
		{
			AbstractDrawable ad = ( AbstractDrawable ) d;
			System.out.println("Game 에서 변경된 걸 알아차림");
			System.out.println(ad.getXY());
			System.out.println(ad.toString());
			System.out.println(ad.getClass().getName());
		}
	};

	public Game()
	{
		drawRunnable = new DrawRunnable();
		drawRunnable.start();
	}

	public boolean isCollision(Drawable d1, Drawable d2)
	{
		if ( (d1.getClass().isAnnotationPresent(Friend.class) && d2.getClass().isAnnotationPresent(Enemy.class))
				|| (d1.getClass().isAnnotationPresent(Enemy.class) && d2.getClass().isAnnotationPresent(Friend.class)) )
			return true;

		return false;
	}
	
	public void setDrawable(Drawable d)
	{
		allDrawable.add(d);
		classifDrawable(d);
		drawRunnable.enqueue(d);
	}

	public void classifDrawable(Drawable d)
	{
		if ( d.getClass().isAnnotationPresent(Friend.class) )
			friendDrawable.add(d);
		if ( d.getClass().isAnnotationPresent(Enemy.class) )
			enemyDrawable.add(d);
	}

	public void moveDrawable()
	{
		int size = allDrawable.size();
		if ( size > 0 )
		{
			int target = sR.nextInt(size);
			Drawable d = allDrawable.get(target);
			((AbstractDrawable)d).setOnDrawableChangeListner(listener);
			d.incPosition();
			drawRunnable.enqueue(d);
		}
	}

	public void saveDrawable(ObjectOutputStream out)
	{
		for ( Drawable d : allDrawable )
		{
			try
			{
				out.writeObject(d);
			}
			catch ( IOException e )
			{
				e.printStackTrace();
			}
		}
	}

	public void loadDrawable(ObjectInputStream in)
	{
		try
		{
			while ( true )
			{
				Drawable d = ( Drawable ) in.readObject();
				if ( d == null )
					break;
				classifDrawable(d);
				drawRunnable.enqueue(d);
			}
		}
		catch ( ClassNotFoundException e )
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch ( IOException e )
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
