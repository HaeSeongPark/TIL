package ch15_IO;

import java.io.*;

public class FileReaderEx1 {
	public static void main(String[] args) {
		String fileName = "test.txt";
		try (FileInputStream fis = new FileInputStream(fileName);
			 FileReader fr = new FileReader(fileName)){
			
			int data = 0;
			
			while((data=fis.read())!=-1)
				System.out.print((char)data);
			System.out.println();
			
			while((data=fr.read())!=-1)
				System.out.print((char)data);
			System.out.println();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
