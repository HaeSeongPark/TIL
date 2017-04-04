package ch4_Control_Flow_Statements;

import java.util.Scanner;

public class FlowEx11 {
	public static void main(String[] args) {
		char gender;
		String regNo = "";
		System.out.print("당신의 주민번호를 입력하세요.(011231-1111222)>");
		
		Scanner scanner = new Scanner(System.in);
		regNo = scanner.nextLine();
		
		gender = regNo.charAt(7);
		
		switch(gender){
		case '1': case '3':
			switch(gender){
			case '1':
				System.out.println("2000년 이전 출생 남자");
				break;
			case '3':
				System.out.println("2000년 이후 출생 남자");
			}
			break;
		case '2': case '4':
			switch(gender){
			case '2':
				System.out.println("당신은 2000년 이전에 출생한 여자입니다.");
				break;
			case '4':
				System.out.println("당신은 2000년 이후에 출생한여자입니다.");
				break;
			}
			break;
		default:
			System.out.println("유효하지 않은 주민등록번호");
		}
	}
}
