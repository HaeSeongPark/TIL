package ch11_Collection_Framework;

import java.util.TreeSet;

public class TreeSetEx2 {
	public static void main(String[] args) {
		TreeSet<Integer> treeSet = new TreeSet<>();
		
		int[] num = { 80,50,85,100,65,35,10,45};
		
		for(int i=0; i<num.length; i++){
			treeSet.add(num[i]);
		}
		System.out.println(treeSet);
		System.out.println(treeSet.descendingSet());
		System.out.println(treeSet.headSet(50,true));
		System.out.println(treeSet.tailSet(50));
		
	}
}
