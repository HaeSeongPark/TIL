package ch15_Exercise;

import java.io.*;

public class HexaViewer {
	public static void main(String[] args) {
		try {
			File f = new File(args[0]);
			FileInputStream fr = new FileInputStream(f);
			BufferedInputStream in = new BufferedInputStream(fr);

			int data = 0;

			while ((data = in.read()) != -1) {
				System.out.printf("%x  ", data);
			}
		} catch (FileNotFoundException e) {
			System.out.println("파일을 찾지 못했습니다.");
		} catch (Exception e) {
			System.out.println("USAGE:java  FileHead 10 FILENAME");
		}
	}
}
