package ch08;

public class Dice9 implements Dice
{
	@Override
	public int get()
	{
		return (int)(Math.random()*9)+1;
	}
}
