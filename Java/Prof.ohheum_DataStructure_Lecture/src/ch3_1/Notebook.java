package ch3_1;

public class Notebook extends Computer
{
	private double screenSize;
	private double weight;
	
	public Notebook(String manufacturer, String processor, int ramSize, int diskSzie, double processorSpeed,
			double screenSize, double weight)
	{
		super(manufacturer , processor , ramSize , diskSzie , processorSpeed);
		this.screenSize = screenSize;
		this.weight = weight;
	}

	@Override
	public String toString()
	{
		return "Notebook [ " + super.toString() + "screenSize=" + screenSize + ", weight=" + weight + "]";
		
	}
}
