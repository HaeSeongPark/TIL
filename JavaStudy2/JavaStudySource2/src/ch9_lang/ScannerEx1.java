package ch9_lang;

import java.util.Scanner;

public class ScannerEx1 {
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		String[] argArr = null;
		
		while(true){
			String prompt = ">>";
			System.out.print(prompt);
			
			String input = s.nextLine();
			
			argArr = input.trim().split(" +");
			
			String command = argArr[0].trim();
			
			if(command.equals("")) continue;
			
			if(command.equalsIgnoreCase("q")){
				System.exit(0);
			} else {
				for(int i=0; i < argArr.length; i++)
					System.out.println(argArr[i]);
			}
		}
	}
}
