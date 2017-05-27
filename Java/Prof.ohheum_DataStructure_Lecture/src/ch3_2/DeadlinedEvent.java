package ch3_2;

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
}
