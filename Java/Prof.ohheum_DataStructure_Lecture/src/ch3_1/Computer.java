package ch3_1;

public class Computer
{
	private String manufacturer;
	private String processor;
	private int ramSize;
	private int diskSzie;
	private double processorSpeed;
	
	public Computer(String manufacturer, String processor, int ramSize, int diskSzie, double processorSpeed)
	{
		this.manufacturer = manufacturer;
		this.processor = processor;
		this.ramSize = ramSize;
		this.diskSzie = diskSzie;
		this.processorSpeed = processorSpeed;
	}
	
	public double computePower()
	{
		return ramSize * processorSpeed;
	}

	public int getRamSize()
	{
		return ramSize;
	}

	public int getDiskSzie()
	{
		return diskSzie;
	}

	public double getProcessorSpeed()
	{
		return processorSpeed;
	}

	@Override
	public String toString()
	{
		return "Computer [manufacturer=" + manufacturer + ", processor=" + processor + ", ramSize=" + ramSize
				+ ", diskSzie=" + diskSzie + ", processorSpeed=" + processorSpeed + "gigahertz" + "]";
	}
}
