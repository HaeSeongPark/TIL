package ch3_4;

public abstract class Event implements Comparable<Event>
{
	public String title;

	public Event(String title)
	{
		this.title = title;
	}
	
	public abstract boolean isRelevant(MyDate d);
	public abstract MyDate getRepresentativDate();
	
	@Override
	public int compareTo(Event o)
	{
		return getRepresentativDate().compareTo(o.getRepresentativDate());
	}
}
