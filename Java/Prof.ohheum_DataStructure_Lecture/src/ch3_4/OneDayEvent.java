package ch3_4;

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
		return title + "," + date;
	}

	@Override
	public boolean isRelevant(MyDate d)
	{  // compateTo가 같으면 0을 반환하니까 0이랑 같으면 true
		return date.compareTo(d) == 0;
	}

	@Override
	public MyDate getRepresentativDate()
	{
		return date;
	}
}
