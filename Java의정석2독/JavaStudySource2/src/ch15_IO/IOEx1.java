package ch15_IO;

import java.io.*;
import java.util.Arrays;

public class IOEx1 {
	public static void main(String[] args) {
		byte[] inSrc = { 0,1,2,3,4,5,6,7,8,9 };
		byte[] outSrc = null;
		
		ByteArrayInputStream input = new ByteArrayInputStream(inSrc);
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		
		int data = 0;
		
		while((data=input.read())!=-1)
			output.write(data);
		
		outSrc = output.toByteArray();
		
		System.out.println("Input Stream : " + Arrays.toString(inSrc));
		System.out.println("Output Stream : " + Arrays.toString(outSrc));
	}
}
