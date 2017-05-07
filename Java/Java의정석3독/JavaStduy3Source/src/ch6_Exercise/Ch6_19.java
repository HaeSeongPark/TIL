package ch6_Exercise;

public class Ch6_19 {
	public static void change(String str){
		str += "456";
	}
	public static void main(String[] args){
		String str = "ABC123";
		System.out.println(str);
		change(str);
		System.out.println("After change:"+str);
		/*
		 * ABC123
		   After change: ABC123
		   문자열은 내용을 변경할 수 없기 때문에 
		   		str += "456"; 여기서 새로운 문자열이 생성된다.
		   		change메서드 안에 str지역변수는 새로운 문자열을 가르킴
		 */
	}
}
