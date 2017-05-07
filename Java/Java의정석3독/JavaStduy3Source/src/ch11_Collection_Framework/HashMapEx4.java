package ch11_Collection_Framework;

import java.util.*;
import java.util.Map.Entry;

public class HashMapEx4
{
	public static void main(String [] args)
	{
		String[] data = {"A","K","A","K","D","K","A","K","K","K","Z","D"};

		HashMap<String , Integer> map = new HashMap<>();
		
		for(int i=0; i<data.length; i++)
		{
			Integer count = map.get(data[i]);
			if(map.containsKey(data[i]))
				map.put(data[i] , count+1);
			else
				map.put(data[i] , 1);
		}
		
		Iterator<Entry<String , Integer>> it = map.entrySet().iterator();
		
		while(it.hasNext())
		{
			Entry<String , Integer> e = it.next();
			int value = e.getValue();
			System.out.println(e.getKey() + " : " + printBar('#',value) + value);
		}
	}
	public static String printBar(char ch, int value)
	{	char[] bar = new char[value];
	
		for(int i=0; i<value; i++)
		{
			bar[i] = ch;
		}
		
		return new String(bar);
	}
}
