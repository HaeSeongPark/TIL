package ch13_interface;

public class Dice6 implements Dice
{
	// get메소드를 구현
	@Override
	public int get()
	{	
		return (int)(Math.random()*6)+1;
	}
}
