package ch5_array_Exercise;

import java.util.Scanner;

public class ch5_13 {
	public static void main(String[] args) {
		String[] words = { "television", "computer", "mouse", "phone" };
		
		Scanner scanner = new Scanner(System.in);
		
		for(int i=0; i < words.length; i++){
			char[] question = words[i].toCharArray(); // String을 char[]로 변환
			
			// char배열 question에 담긴 문자의 위치를 임으로 바꾼다.
			for(int j=0; j< question.length; j++){
				int random = (int)(Math.random()*question.length);
				char tmp = question[j];
				question[j] = question[random];
				question[random] = tmp;
			}
			
			System.out.printf("Q%d.의 %s의 정담을 입력하세요.>",i+1, new String(question));
			
			String answer = scanner.nextLine();
			
			//trim으로 answer의 좌우 공백을 제거한 후, equals로 word[i]와 비교
			if(words[i].equals(answer.trim()))
					System.out.printf("맞았습니다.%n%n");
			else
				System.out.printf("틀렸습니다.%n%n");
		}
	}
}
