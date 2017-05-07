package 즐거운자바;

import java.util.*;

//Stack이 Vector를 상속받는데...
//뭔가 찝찝해서....
//Vector는 리스트를 상속받는데 List는 순서가 있잖아
//자바의정석책에도 대기자 명단을 예로 들었는데
//대기자 명단이란게  1번째 오는 사람이 가장 먼저 처리되는  FIFO구조인데 큐처럼
//Stack은 FILO 이잖아
// 그러니까  결국 Stack extends Vector인데
//Vector는 FIFO  Stack은 LIFO 인데 상속관계라... 뭐지? 뭘까?
// Stack에 쌓인 것 중 중간에 있는거 조회는 가능한데, 
// 중간에 있는 것을 꺼내는 메서드는 없으니까 맞는건가?
// get도 elementAt도 조회만 되고 삭제는 안되는데...

public class StackVector {
	public static void main(String[] args) {
		Stack a = new Stack();
		
		a.push("1");
		a.push("2");
		a.push("3");
		a.push("4");
		a.push("5");
//		System.out.println(a.get(3));
//		
//		System.out.println(a.pop());
//		System.out.println();
//		while(!a.isEmpty())
//		{
//			System.out.println(a.pop());
//		}
	
		
		Vector v = new Vector(5);
		v.add(1);
		v.add(2);
		v.add(3);
		v.add(4);
		System.out.println(v.elementAt(3));
		
		System.out.println(v);
		
		ArrayDeque sdf = new ArrayDeque();
		sdf.offerFirst("df");
	}
}
