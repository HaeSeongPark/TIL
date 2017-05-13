package exercise;

public class Sum
{
	private int number = 0;
	private int maxNumber = 0;
	private OnMaxNumberCb myCallback;
	
	public void setOnMaxNumberCv(OnMaxNumberCb callback)
	{
		myCallback = callback;
	}
	
	public void setMaxNumber(int max)
	{
		maxNumber = max;
	}
	
	public int addNumber(int adder)
	{
		number += adder;
		
		if( myCallback != null )
		{
			if(number >= maxNumber)
			{
				myCallback.onMaxNumber(number , number-maxNumber);
			}
		}
		
		return number;
	}
	
	public int getTotal()
	{
		return number;
	}
}
