package ch8_Exercise;

import java.util.*;

public class Ch8_8 {
	public static void main(String[] args) {
		int answer = (int)(Math.random()*100) +1;
		int input = 0;
		int count = 0;
		
		
		do{
			count++;
			System.out.print("1과 100사이의 값을 입력하세요 : ");
			
			Scanner scanner = new Scanner(System.in);
			try {
				input = scanner.nextInt();
			} catch (Exception e) {
				System.out.println("유효하지 않은 값입니다. 다시 값을 입력해주세요.");
				continue;
			} 
			
			if(answer > input){
				System.out.println("더 큰 수를 입력하세요.");
			} else if(answer < input){
				System.out.println("더 작은 수를 입력하세요.");
			} else {
				System.out.println("맞췄습니다.");
				System.out.println("시도횟누는 " + count + "번입니다.");
				break;
			}
		} while(true);
		
	}
}
