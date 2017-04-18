package ch11_Collection_Framework;

import java.util.Scanner;
import java.util.Stack;

// 괄호가 올바른지 체크!!!
public class ExpValidCheck {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		Stack st = new Stack();
		String expression = scanner.nextLine();
		
		System.out.println("expression : " + expression);
		
		try {
			for(int i=0; i<expression.length(); i++){
				char ch = expression.charAt(i);
				if(ch=='(') st.push(ch+"");
				else if(ch==')') st.pop();
			}
			
			if(st.isEmpty())
				System.out.println("괄호가 일치합니다.");
			else
				System.out.println("괄호가 일치하지 않습니다.");
		} catch (Exception e) {
			System.out.println("괄호가 일치하지 않습니다.");
		}
	}
}
