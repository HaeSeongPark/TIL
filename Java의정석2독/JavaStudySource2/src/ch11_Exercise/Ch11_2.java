package ch11_Exercise;

import java.util.*;

public class Ch11_2 {
	public static void main(String[] args) {
		ArrayList list = new ArrayList();
		list.add(3);
		list.add(6);
		list.add(2);
		list.add(2);
		list.add(2);
		list.add(7);
		
		HashSet set = new HashSet(list);   // 3,6,2,7  순서x 중복 x
		TreeSet tset = new TreeSet(set);  //  2,3,6,7  순서대로
		Stack stack = new Stack();        // 2,3,6,7 순서대로 넣고 
		stack.addAll(tset);
		
		while(!stack.empty()){
			System.out.println(stack.pop()); // 마지막 7부터 꺼냄
		}
	}
}
