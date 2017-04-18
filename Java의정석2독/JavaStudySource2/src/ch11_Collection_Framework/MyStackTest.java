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

}
