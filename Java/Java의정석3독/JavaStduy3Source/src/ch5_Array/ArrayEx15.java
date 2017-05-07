package ch5_Array;

public class ArrayEx15 {
	public static void main(String[] args) {
		String source = "SOSHELP";
		String[] morse = {
				".-", "-...", "-.-.","-..", "."
				,"..-.", "--.", "....","..",".---"
				, "-.-", ".-..", "--", "-.", "---"
				, ".--.", "--.-",".-.","...","-"
				, "..-", "...-", ".--", "-..-","-.--"
				, "--.." };
//		String result="";
		StringBuffer result = new StringBuffer();
		for(int i=0; i<source.length(); i++){
//			result+=morse[source.charAt(i)-'A'];
			result.append(morse[source.charAt(i)-'A']);
		}
		System.out.println(source);
		System.out.println(result);
	}
}
