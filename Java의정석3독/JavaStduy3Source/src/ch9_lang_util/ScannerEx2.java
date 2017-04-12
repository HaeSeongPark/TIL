package ch9_lang_util;

import java.io.File;
import java.util.Scanner;

public class ScannerEx2 {
	public static void main(String[] args) throws Exception {
		Scanner sc = new Scanner(new File("D:\\newGit\\Java의정석3독\\JavaStduy3Source\\src\\ch9_lang_util\\data2.txt"));
		int sum = 0;
		int cnt = 0;
		
		while(sc.hasNextInt()){
			sum += sc.nextInt();
			cnt++;
		}
		System.out.println("sum="+sum);
		System.out.println("average=" + (double)sum/cnt);
	}
}
