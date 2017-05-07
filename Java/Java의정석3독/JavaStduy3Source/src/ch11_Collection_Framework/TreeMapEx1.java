package ch11_Collection_Framework;

import java.util.*;
import java.util.Map.Entry;

public class TreeMapEx1
{
	public static void main(String [] args)
	{
		String[] data = { "A", "K", "A", "K", "D", "K", "A", "K", "K", "K", "Z", "D" };
		TreeMap<String, Integer> treeMap = new TreeMap<String, Integer>();
		
		for(int i=0; i<data.length; i++)
		{
			if(treeMap.containsKey(data[i]))
			{
				Integer value = treeMap.get(data[i]);
				treeMap.put(data[i] , value+1);
			}
			else
			{
				treeMap.put(data[i] , 1);
			}
		}
		
		Iterator<Entry<String , Integer>> it = treeMap.entrySet().iterator();
		System.out.println("기본정렬");
		while(it.hasNext())
		{
			Entry<String , Integer> e = it.next();
			int value = e.getValue();
			System.out.println(e.getKey() + " : " + printBar('#',value) + " " + value);
		}
		
		System.out.println();
		// map을 ArrayList로 변환한 다음에 Collections.sort()를 이용해서 정렬
		Set<Entry<String , Integer>> set = treeMap.entrySet();
		List<Entry<String , Integer>> list = new ArrayList<>(set);
		Collections.sort(list, new ValueComparator());
		
		
		it = list.iterator();
		System.out.println("값의 크기가 큰 순서로 정렬");
		while(it.hasNext())
		{
			Entry<String , Integer> e = it.next();
			int value = e.getValue();
			String key = e.getKey();
			System.out.println(key + " : " + printBar('#',value) + " " + value);
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
	
	static class ValueComparator implements Comparator<Entry<String , Integer>>
	{

		@Override
		public int compare(Entry<String , Integer> o1, Entry<String , Integer> o2)
		{
			return o2.getValue() - o1.getValue();
		}
		
	}
}
