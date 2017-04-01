package ch6_oop1_Exercise;

public class ch6_19 {
	
	public static void change(String str){
		str += "456";
	}
	public static void main(String[] args) {
		String str = "ABC123";
		System.out.println(str); // ABC123
		change(str);
		System.out.println("After change:"+str);  // ABC123
		
		/*
		 * String은 참조변수 이긴 하지만 
		 * 문자열 내용을 변경할 수 없어
		 * 덧셈연산을 하면 새롱누 문자열이 생성됨.
		 */
	}
}
