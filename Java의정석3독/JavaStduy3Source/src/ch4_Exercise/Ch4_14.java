package ch4_Exercise;

import java.util.Scanner;

public class Ch4_14 {
	public static void main(String[] args) {
		int answer = (int)(Math.random()*100)+1;
		int input = 0;
		int count = 0;
		
		Scanner s = new Scanner(System.in);
		
		do{
			count++;
			System.out.print("1부터 100사이의 값을 입력");
			input = s.nextInt();
			
			if(input == answer){
				System.out.println("맞음");
				break;
			} else if(input < answer){
				System.out.println(" 큰 수 입력");
			} else {
				System.out.println(" 작은 수 입력");
			}
				
			
		}while(true);
	}
}
