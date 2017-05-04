package ch11_Collection_Framework;

import java.util.*;

public class PropertiesEx1
{
	public static void main(String [] args)
	{
		Properties prop = new Properties();
		
		prop.setProperty("timeout", "30");
		prop.setProperty("language", "kr");
		prop.setProperty("size", "10");
		prop.setProperty("capacity", "10");
		
		Enumeration e = prop.propertyNames();
		while(e.hasMoreElements())
		{
			String elements = (String)e.nextElement();
			System.out.println(elements + "=" + prop.getProperty(elements));
		}
		System.out.println();
		prop.setProperty("size" , "20");
		System.out.println("size"+prop.getProperty("size"));
		System.out.println("capacity="+prop.getProperty("capacity","20"));
		System.out.println("loadfactor="+prop.getProperty("loadfactor","0.67"));
		System.out.println(prop);
		prop.list(System.out);
	}
}
