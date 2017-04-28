package ch15_IO;

import java.io.*;

public class StandardIOEx3 {
	public static void main(String[] args) {
		PrintStream ps = null;
		FileOutputStream fos = null;
		
		try {
			fos = new FileOutputStream("test.txt");
			ps = new PrintStream(fos);
			System.setOut(ps);
		} catch (FileNotFoundException e) {
			System.out.println("no file");
		}
		
		System.out.println("hello by out");
		System.err.println("hello by err");
	}
}
