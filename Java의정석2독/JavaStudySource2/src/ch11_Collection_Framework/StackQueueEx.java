package ch11_Collection_Framework;

import java.util.*;

public class StackQueueEx {
	public static void main(String[] args) {
		// Stack클래스 이용
		Stack st = new Stack();
		
		// Queue의 인터페이스의 구현체인 LinkedList를 사용
		Queue q = new LinkedList();
		
		st.push("0");
		st.push("1");
		st.push("2");
		
		q.offer("0");
		q.offer("1");
		q.offer("2");
		
//		q.remove(); 제일 처음에 입력된 것 제거
		
//		ListIterator it = ((LinkedList)q).listIterator();
//		while(it.hasNext())
//			System.out.println("."+it.next());
		
		System.out.println("index"+st.lastIndexOf("0"));
		
		System.out.println(" = Stack = ");
		while(!st.empty()){
			System.out.println(st.pop());
		}
		
		
		System.out.println(" = Queue = ");
		while(!q.isEmpty()){
			System.out.println(q.poll());
		}
	}
}
