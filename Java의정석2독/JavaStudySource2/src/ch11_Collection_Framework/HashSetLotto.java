package ch11_Collection_Framework;

import java.util.*;

public class HashSetLotto {
	public static void main(String[] args) {
		Set set = new HashSet();
		
		for(int i=0; set.size()<6; i++){
			int num = (int)(Math.random()*45)+1;
			set.add(num);
		}
		List list = new LinkedList(set); // LinkedList(Coleection c)
		Collections.sort(list);
		System.out.println(list);
	}
}
