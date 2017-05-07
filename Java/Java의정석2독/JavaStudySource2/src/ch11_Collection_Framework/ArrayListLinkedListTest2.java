package ch11_Collection_Framework;

import java.util.*;

public class ArrayListLinkedListTest2 {
	public static void main(String[] args) {
		ArrayList al = new ArrayList(1_000_000);
		LinkedList ll = new LinkedList();
		add(al);
		add(ll);
		
		System.out.println("접근시간테스트");
		System.out.println("ArrayList : " + access(al));
		System.out.println("LinkedList : " + access(ll));
	}
	
	public static void add(List list){
		for(int i=0; i<100000; i++) list.add(i+"");
	}
	
	public static long access(List list){
		long start = System.currentTimeMillis();
		for(int i=0; i<10000;i++) list.get(i);
		long end = System.currentTimeMillis();
		return end-start;
	}
	/*
	 * ArrayList al = new ArrayList(1000000);
	 * for(int i=0; i<100000;i++) al.add(i+"");
	 * 
	 * ArrayList, LinkedList등 컬렉션 프레임웍에 속한 대부분의 컬렉션 클래스들은
	 * 서로 변환이 가능해서 각 클래스의 장점에 맞게 변환해서 사용 가능
	 * 
	 * LinkedList ll = new LinkedList(al);
	 * for(int i=0; i<1000;i++) ll.add(500,"X");
	 * 
	 */

}
