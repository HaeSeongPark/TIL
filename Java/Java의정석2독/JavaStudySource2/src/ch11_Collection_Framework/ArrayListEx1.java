package ch11_Collection_Framework;

import java.awt.List;
import java.util.ArrayList;
import java.util.Collections;

public class ArrayListEx1 {
	public static void main(String[] args) {
		// 길이를 직접 지정하는 것이 좋다. 가능하면 길게...
		ArrayList list1 = new ArrayList(10);
		
		// list1에 5,4,2,0,1,3순으로 추가
		list1.add(5); // list.add(new Integer(5));
		list1.add(4);
		list1.add(2);
		list1.add(0);
		list1.add(1);
		list1.add(3);
		
		// list2에 list1의 1~3까지를 복사
		ArrayList list2 = new ArrayList(list1.subList(1, 4));
		print(list1,list2);  //list1:[5, 4, 2, 0, 1, 3]
							 //list2:[4, 2, 0]
		
		// list1과 list2를 정렬
		Collections.sort(list1);  // list1:[0, 1, 2, 3, 4, 5]
		Collections.sort(list2);  // list2:[0, 2, 4]
		print(list1, list2);
		
		// list1이 list2의 모든 내용을 가지고 있을 때 true
		//
		System.out.println("list1.containsAll(list2):"+list1.containsAll(list2));
		
		list2.add("B");
		list2.add("C");
		list2.add(3,"A");
		print(list1,list2);  // list1:[0, 1, 2, 3, 4, 5]
							 // list2:[0, 2, 4, A, B, C]
		
		
		list2.set(3, "AA");
		System.out.println(list2);  // list2:[0, 2, 4, AA, B, C]
		
		//list1에서 list2와 겹치는 부분만 남기고 나머지는 삭제한다.
		System.out.println("list1.retainAll(list2):"+list1.retainAll(list2));
		print(list1,list2);
		
		// list2에서 list1에 포함된 객체들을 삭제
		for(int i=list2.size()-1; i>=0; i--){
			if(list1.contains(list2.get(i)))
				list2.remove(i);
		}
		print(list1,list2);  // list1:[0, 2, 4]
							 // list2:[AA, B, C]
		
	}
	static void print(ArrayList list1, ArrayList list2){
		System.out.println("list1:"+list1);
		System.out.println("list2:"+list2);
	}
}
