package ch12_2;

import ch12.AbstractFactory;
import ch12.BusFactory;
import ch12.TruckFactory;

public class FactoryTest01
{
	public static void main(String [] args)
	{
		AbstractFactory factroy = new TruckFactory();
		factroy.exex();
	}
}
