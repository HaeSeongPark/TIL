package ch15_IO;

import java.util.*;
import java.io.*;

public class SequenceInputStreamEx {
	public static void main(String[] args) {
		byte[] arr1 = { 1, 2, 3 };
		byte[] arr2 = { 4, 5, 6 };
		byte[] arr3 = { 7, 8, 9 };
		byte[] outSrc = null;
		
		Vector<InputStream> files = new Vector<>();
		
		files.add(new ByteArrayInputStream(arr1));
		files.add(new ByteArrayInputStream(arr2));
		files.add(new ByteArrayInputStream(arr3));
		

		
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		
		int data = 0;
		try(SequenceInputStream input = new SequenceInputStream(files.elements()))
		{
			while((data=input.read())!=-1){
				bos.write(data);
			}
		} catch (Exception e) {
		} 
		
		outSrc = bos.toByteArray();
		
		System.out.println("Input Source1 " + Arrays.toString(arr1));
		System.out.println("Input Source2 " + Arrays.toString(arr2));
		System.out.println("Input Source3 " + Arrays.toString(arr3));
		System.out.println("Output Source " + Arrays.toString(outSrc));
	}
}
