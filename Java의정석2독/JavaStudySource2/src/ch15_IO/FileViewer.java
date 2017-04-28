package ch15_IO;

import java.io.*;

public class FileViewer {
	public static void main(String[] args) throws Exception{
		FileInputStream fis = new FileInputStream(args[0]);
		
		int data = 0;
		
		while((data=fis.read())!=-1){
			char c = (char)data;
			System.out.print(c);
		}
	}
}
