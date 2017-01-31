package ch11;

import java.util.*;

public class IteratorEx1 {
	public static void main(String[] args) {
		ArrayList list = new ArrayList();
		list.add("1");
		list.add("2");
		list.add("3");
		list.add("4");
		
		Iterator it = list.iterator();
		
		while(it.hasNext()){
			Object obj = it.next();
			System.out.println(obj);
		}
	}
}
