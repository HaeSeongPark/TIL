package exercise;

public class CallbackTest
{
	public static void main(String [] args)
	{
		Sum total = new Sum();
		OnMaxNumberCb callback = new OnMaxNumberCb()
		{
			@Override
			public void onMaxNumber(int number, int exceed)
			{
				System.out.println("Current sum is " + number + " and exceeds " + exceed);
			}
		};
		
		total.setMaxNumber(50);
		total.setOnMaxNumberCv(callback);
		for(int i=1; i<=11; i++)
		{
			total.addNumber(i);
		}
		
		System.out.println("Total is " + total.getTotal());
	}	
}
