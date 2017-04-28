package ch15_IO;

import java.util.*;
import java.io.*;

public class IOEx2 {
	public static void main(String[] args) {
		byte[] inSrc = { 0,1,2,3,4,5,6,7,8,9};
		byte[] outSrc = null;
		
		byte[] temp = new byte[inSrc.length];
		
		ByteArrayInputStream input = new ByteArrayInputStream(inSrc);
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		
		input.read(temp, 0, temp.length); // 읽어 온 데이털르 배열 temp에 담는다.
		output.write(temp,4,5); // temp[4]부터 4개의 데이털르 write한다. 
		
		outSrc = output.toByteArray();
		
		System.out.println("Input Source " + Arrays.toString(inSrc));
		System.out.println("temp " + Arrays.toString(temp));
		System.out.println("Ouput Source " + Arrays.toString(outSrc));
	}
}
