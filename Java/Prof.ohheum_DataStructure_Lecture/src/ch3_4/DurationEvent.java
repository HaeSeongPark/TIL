package ch3_4;

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

	@Override
	public boolean isRelevant(MyDate d)
	{
		// begin <= me <= end
		return begin.compareTo(d) <=0 && end.compareTo(d) >= 0;
	}

	@Override
	public MyDate getRepresentativDate()
	{
		return begin;
	}
}
