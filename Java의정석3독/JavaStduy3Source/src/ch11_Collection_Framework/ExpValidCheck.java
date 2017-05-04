package ch11_Collection_Framework;

import java.util.*;

public class ExpValidCheck {
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		System.out.print("입력 : ");
		String expresion = s.nextLine();
		Stack<Character> st = new Stack<>();
		
		int length = expresion.length();
		try {
			for(int i=0; i<length; i++){
				char ch = expresion.charAt(i);
				
				if(ch=='(')
					st.push(ch);
				else if(ch==')')
					st.pop();
			}
			if(st.isEmpty())
				System.out.println("괄호 일치");
			else
				System.out.println("괄호 불일치");
		} catch (EmptyStackException e) {
			System.out.println("괄호 불일치");
		}
	}
}
