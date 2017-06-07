package ch14_primitive_reference_array;

import ch12.Car;

public class PrintlnTest
{
	public static void main(String [] args)
	{
		boolean booleanValue = false;
		byte byteValue = 1;
		char charValue1 = 'a';
		char charValue2 = 65; // A
		short shortValue = -20;
		int intValue = 500;
		long longValue = 500_000L;
		float floatVlaue = 50.4f;
		double doubleValue = 50.4;
		char[] charArray = new char[]{'h','i'};
		String stringValue = "hi";
		Object obj1 = new Object();
		Car car = new Car();
		
		// 다양한 println이 있음
		System.out.println(booleanValue);
		System.out.println(byteValue);
		System.out.println(charValue1);
		System.out.println(charValue2);
		System.out.println(shortValue);
		System.out.println(intValue);
		System.out.println(longValue);
		System.out.println(floatVlaue);
		System.out.println(doubleValue);
		System.out.println(charArray);
		System.out.println(stringValue);
		System.out.println(obj1);
		System.out.println(car);
	}
}
