package ch3_2;

public class DurationEvent extends Event
{
	MyDate begin;
	MyDate end;
	
	public DurationEvent(String title, MyDate begin, MyDate end)
	{
		super(title);
		this.begin = begin;
		this.end = end;
	}
	
	@Override
	public String toString()
	{
		return title + " " + begin + "~" + end;
	}
}
