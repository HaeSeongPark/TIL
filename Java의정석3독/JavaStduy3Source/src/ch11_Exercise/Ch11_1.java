package ch11_Exercise;

import java.util.*;

public class Ch11_1
{
	public static void main(String [] args)
	{
		ArrayList list1 = new ArrayList();
		ArrayList list2 = new ArrayList();
		ArrayList kyo = new ArrayList();
		ArrayList cha = new ArrayList();
		ArrayList hap = new ArrayList();
		
		list1.add(1);
		list1.add(2);
		list1.add(3);
		list1.add(4);
		
		list2.add(3);
		list2.add(4);
		list2.add(5);
		list2.add(6);
		
		kyo.addAll(list1); // list1 1234 list 3456
		kyo.retainAll(list2); // kyo 3,4
		
		cha.addAll(list1); 
		cha.removeAll(list2);
		
		hap.addAll(list1);
		hap.removeAll(kyo);
		hap.addAll(list2);
		
		System.out.println(list1);
		System.out.println(list2);
		System.out.println(kyo);
		System.out.println(cha);
		System.out.println(hap);
	}
}
