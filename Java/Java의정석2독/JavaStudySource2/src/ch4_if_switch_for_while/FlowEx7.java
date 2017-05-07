package ch4_if_switch_for_while;

import java.util.Scanner;

public class FlowEx7 {
	public static void main(String[] args) {
		int userInt, comInt;
		String user, com;
		
		System.out.print("가위(1), 바위(2), 보(3) 중 하나를 입력하세요.>");
		
		Scanner scanner = new Scanner(System.in);
		String tmp = scanner.nextLine();
		
		userInt = Integer.parseInt(tmp);
		comInt = (int)(Math.random()*3) + 1;
		
		user = RockPaperSissors(userInt);
		com = RockPaperSissors(comInt);
		
		System.out.println("당신은 "+ user + "입니다.");
		System.out.println("컴은 " + com+ "입니다.");
		
		switch(userInt-comInt){
		case 2: case -1:
			System.out.println("당신이 졌습니다.");
			break;
		case 1: case -2:
			System.out.println("당신이 이겼습니다.");
		case 0:
			System.out.println("비겼습니다.");
//			break; // 마지막 문장이므로 break를 사용할 필요가 없다.
		}
	}
	static String RockPaperSissors(int input){
		String tmp;
		switch(input){
		case 1:
			tmp = "가위";
			break;
		case 2:
			tmp = "바위";
			break;
		default:
			tmp ="보";
		}
		return tmp;
	}
}
