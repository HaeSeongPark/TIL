package ch15_IO;

import java.io.*;
import java.util.*;

public class IOEx3 {
	public static void main(String[] args) throws Exception{
		byte[] inSrc = { 0,1,2,3,4,5,6,7,8,9};
		byte[] outSrc = null;
		
		byte[] temp = new byte[4];
		
		ByteArrayInputStream input = new ByteArrayInputStream(inSrc);
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		
		System.out.println("Input Source : " + Arrays.toString(inSrc));
		
		while(input.available()>0){
			int len = input.read(temp);
			output.write(temp, 0, len);
			
			outSrc = output.toByteArray();
			
			printArr(temp, outSrc);
		}
	}
	
	static void printArr(byte[] temp, byte[] outSrc){
		System.out.println(" temp : " + Arrays.toString(temp));
		System.out.println(" outSrc : " + Arrays.toString(outSrc));
	}
}
