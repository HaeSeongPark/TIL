package ch08;

public class Dice6 implements Dice
{
	@Override
	public int get()
	{
		return (int)(Math.random()*6)+1;
	}
}
