package ch15_IO;

import java.io.*;

public class StringReaderWriterEx {
	public static void main(String[] args) throws Exception{
		String s = "ABCD";
		StringReader input = new StringReader(s);
		StringWriter ouput = new StringWriter();
		
		int data = 0;
		
		while((data=input.read())!=-1){
			ouput.write(data);
		}
		
		System.out.println(s);
		System.out.println(ouput.toString());
		System.out.println(ouput.getBuffer().toString());
	}
}
