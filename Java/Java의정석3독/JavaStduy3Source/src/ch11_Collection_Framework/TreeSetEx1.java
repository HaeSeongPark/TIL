package ch11_Collection_Framework;

import java.util.*;

public class TreeSetEx1
{
	public static void main(String [] args)
	{
		TreeSet<String> set = new TreeSet<String>();
		
		String from = "b";
		
		String to = "d";
		
		set.add("abc");	set.add("ailen"); set.add("bat");
		set.add("car"); set.add("Car"); set.add("disc");
		set.add("dance"); set.add("dZZZ");	set.add("dzzzz");
		set.add("elephant"); set.add("elevator"); set.add("fan");
		set.add("flowe");
		
		System.out.println(set);
		System.out.println("range search : from" + from + "to" + to);
		System.out.println("result1 : " + set.subSet(from , to));
		System.out.println("result2 : " + set.subSet(from , to+"zzz"));
		
		List<String> list = new ArrayList<String>(set);
		Collections.sort(list , String.CASE_INSENSITIVE_ORDER);
		System.out.println("list"+list);
	}
}
