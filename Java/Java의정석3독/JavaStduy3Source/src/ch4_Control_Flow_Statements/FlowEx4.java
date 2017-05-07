package ch4_Control_Flow_Statements;

import java.util.Scanner;

public class FlowEx4 {
	public static void main(String[] args) {
		int score = 0;
		char grade = ' ';
		
		System.out.print("점수를 입력하세요.>");
		Scanner scanner = new Scanner(System.in);
		String tmp = scanner.nextLine().trim();
		score = Integer.parseInt(tmp);
		
		if (score >= 90){
			grade = 'A';
		} else if ( score >= 80) {
			grade = 'B';
		} else if ( score >= 70) {
			grade = 'C';
		} else {
			grade = 'D';
		}
//		-------------------
		if ( score >= 90){
			grade = 'A';
		}
		
		if(80 <= score && score < 90)
			grade = 'B';
		if(70<=score && score < 80)
			grade ='C';
		if ( score < 70)
			grade = 'D';
		
		System.out.println("당신의 학점은 " + grade + "입니다.");
	}
}
