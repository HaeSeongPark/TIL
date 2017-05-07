package ch11_Collection_Framework;

import java.util.*;

public class ListIteratorEx1 {
	public static void main(String[] args) {
		ArrayList list = new ArrayList();
		list.add("1");
		list.add("2");
		list.add("3");
		list.add("4");
		
		ListIterator it = list.listIterator();
		
		while(it.hasNext()){
			//순방향으로 진행하면서 읽어온다.
			System.out.println(it.next());
		}
		System.out.println();
		
		while(it.hasPrevious()){
			// 역방향으로 진행하면서 읽어온다.
			System.out.println(it.previous());
		}
		System.out.println();
	}
}
