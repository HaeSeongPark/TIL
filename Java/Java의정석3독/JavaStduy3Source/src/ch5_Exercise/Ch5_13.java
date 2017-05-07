package ch5_Exercise;

import java.util.Scanner;

public class Ch5_13 {
	public static void main(String[] args) {
		String[] words = { "television", "computer", "mouse", "phone" };
		
		Scanner scanner = new Scanner(System.in);
		
		for(int i=0; i<words.length; i++){
			char[] question = words[i].toCharArray();
			
			for(int j=0, length=question.length; j<length; j++){
				int tmp = (int)(Math.random()*length);
				char tmpChar = question[j];
				question[j] = question[tmp];
				question[tmp] = tmpChar;
			}
			
			System.out.printf("Q%d. %s의 정답을 입력하세요",i+1, new String(question));
			String answer = scanner.nextLine();
			if(words[i].equals(answer.trim()))
				System.out.println("정답");
			else
				System.out.println("틀림");
		}
	}
}
