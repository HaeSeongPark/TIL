package ch11_Collection_Framework;

import java.util.*;

public class Test
{
	public static void main(String [] args)
	{
		Object[] objArr= { "1", new Integer(1), "2", "2", "3", "3", "4", "4"};
		Set<Object> set = new HashSet<> ( );
		
		for ( Object object : objArr )
		{
			set.add ( object );
		}
		System.out.println ( set );
	}
}
