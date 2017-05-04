package ch11_Collection_Framework;

public class MyStackTest {

	public static void main(String[] args) {
		MyStack ms = new MyStack();
		ms.push("1");
		ms.push("2");
		ms.push("3");
		
//		while(!ms.empty())
//			System.out.println(ms.pop());
		
		System.out.println(ms.search("3"));
		
	}
//012 ArrayList 배열의 인덱스
//123 값
//스택						   스택은 맨 위에 객체의 index를 1로정의
//3   index 2   size3 -index2 = 1
//2	        1   size3 -index1 = 2
//1         0   size3 -index0 = 3
}
