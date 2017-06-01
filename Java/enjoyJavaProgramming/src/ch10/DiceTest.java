package ch10;

public class DiceTest
{
	public static void main(String [] args)
	{
		Dice d1 = new Dice();
		System.out.println(d1.getFaceCount());

		try
		{
			Dice d2 = new Dice(0);
			System.out.println(d2.getFaceCount());
		}
		catch ( IllegalArgumentException e )
		{
			System.out.println("면이 2개 이상 있어야 합니다.");
		}
		
	}
}
