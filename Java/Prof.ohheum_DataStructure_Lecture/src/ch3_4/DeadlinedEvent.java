package ch3_4;

public class DeadlinedEvent extends Event
{
	MyDate deadline;
	
	public DeadlinedEvent(String title, MyDate deadline)
	{
		super(title);
		this.deadline = deadline;
	}
	
	@Override
	public String toString()
	{
		return title + " " + deadline;
	}

	@Override
	public boolean isRelevant(MyDate d)
	{
		return deadline.compareTo(d) >= 0;
	}

	@Override
	public MyDate getRepresentativDate()
	{
		return deadline;
	}
}
