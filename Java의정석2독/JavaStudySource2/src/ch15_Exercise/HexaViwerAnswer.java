package ch15_Exercise;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.PrintStream;

public class HexaViwerAnswer {

	public static void main(String[] args) {
		File f = new File(args[0]);
		try(FileInputStream input = new FileInputStream(f)) {

			PrintStream output = new PrintStream(System.out);
			
			int data = 0;
			int i = 0;
			
			while ((data = input.read()) != -1) {
				output.printf("%02X ", data);
				if(++i%16==0)
					System.out.println();
			}
		} catch (FileNotFoundException e) {
			System.out.println("파일을 찾지 못했습니다.");
		} catch (Exception e) {
			System.out.println("USAGE:java  FileHead 10 FILENAME");
		}
	}

}
