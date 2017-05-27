package ch3_2;

public class OneDayEvent extends Event
{
	MyDate date;
	
	public OneDayEvent(String title, MyDate date)
	{
		super(title);
		this.date = date;
	}
	
	@Override
	public String toString()
	{
		return "[" + title + "," + date + "]";
	}
}
