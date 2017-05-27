package ch3_2;

public class MyDate
{
	int year;
	int month;
	int day;

	public MyDate(int year, int month, int day)
	{
		this.year = year;
		this.month = month;
		this.day = day;
	}

	@Override
	public String toString()
	{
		return year + "/" + month + "/" + day;
	}
}
