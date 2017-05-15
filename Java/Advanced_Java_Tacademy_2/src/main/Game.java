package main;

import annotation.Enemy;
import annotation.Friend;
import drawable.Drawable;

public class Game
{
	public boolean isCollision(Drawable d1, Drawable d2)
	{
		if((d1.getClass().isAnnotationPresent(Friend.class) && 
				d2.getClass().isAnnotationPresent(Enemy.class)) 
				||(d1.getClass().isAnnotationPresent(Enemy.class) &&
						d2.getClass().isAnnotationPresent(Friend.class)))
			return true;
		
		return false;
	}
}
