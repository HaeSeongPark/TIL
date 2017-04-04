package ch4_Control_Flow_Statements;

import java.util.Scanner;

public class FlowEx5 {
	public static void main(String[] args) {
		int num = 0;
		int sum = 0 ;
		
		System.out.print("숫자를 입력하세요.(예:12345)>");
		Scanner scanner = new Scanner(System.in);
		String tmp = scanner.nextLine();
		num = Integer.parseInt(tmp);
		
		while(num > 0){
			sum += num % 10;
			System.out.printf("sum=%3d num=%d%n",sum,num);
			num /= 10;
		}
	}
}
