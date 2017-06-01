package ch08;

import java.util.List;
import java.util.Vector;

public class CollectionTest
{
	public static void main(String [] args)
	{
		List<String> list = new Vector<>();
		list.add("a");
		list.add("b");
		list.add("c");
		
		for ( String string : list )
		{
			System.out.println(string);
		}
	}
}
