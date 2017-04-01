package ch3_operator_Excercise;

/*
 * 소대문자변경
 */

public class ch3_10 {
	public static void main(String[] args) {
		char ch = 'A';
		//             대문자면 소문자로
		char lowerCase =  ('A'<=ch && ch<'Z') ? (char)(ch+32) : ch;
		
		System.out.println("ch:"+ch);
		System.out.println("ch to lowerCase:"+lowerCase);
	}
}
