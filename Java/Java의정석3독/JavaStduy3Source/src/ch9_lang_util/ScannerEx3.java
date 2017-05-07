package ch9_lang_util;

import java.io.File;
import java.util.Scanner;

public class ScannerEx3 {
	public static void main(String[] args) throws Exception{
		Scanner sc = new Scanner(new File("D:\\newGit\\Java의정석3독\\JavaStduy3Source\\src\\ch9_lang_util\\data3.txt"));
		
		int cnt = 0;
		int totalSum = 0;
		
		while(sc.hasNextLine()){
			String line = sc.nextLine();
			Scanner sc2 = new Scanner(line).useDelimiter(",");
			int sum = 0;
			
			while(sc2.hasNextInt()){
				sum += sc2.nextInt();
			}
			
			System.out.println(line + ", sum " + sum);
			totalSum += sum;
			cnt++;
		}
		System.out.println("Line:" + cnt + ", Total:" + totalSum );
	}
}
