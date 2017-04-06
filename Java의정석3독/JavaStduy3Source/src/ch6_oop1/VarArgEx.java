package ch6_oop1;

public class VarArgEx {
	public static void main(String[] args) {
		String[] strArr = { "100", "200", "300" };
		
		System.out.println(concatenate("","100","200","300"));
		System.out.println(concatenate("-",strArr));
		System.out.println(concatenate(",", new String[]{"1","2","3"}));
		System.out.println("["+concatenate(",", new String[0])+"]");
		System.out.println("["+concatenate(",")+"]");
	}
	static String concatenate(String delim, String... args){
		String result = "";
		
		for(String str : args)
			result += str + delim;
		
		return result;
	}
	// 가변인자를 선언한 메서드를 오버로딩하지 않는 게 좋다.
	/*
	 * static String concatenate(String...args){
	 * 	return concatenate("", args);
	 */
}
