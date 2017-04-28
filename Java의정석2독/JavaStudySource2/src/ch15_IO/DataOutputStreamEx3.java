package ch15_IO;

import java.io.*;

public class DataOutputStreamEx3 {
	public static void main(String[] args) {
		int[] score = { 100, 90, 95, 85, 50 };
		
		try(FileOutputStream fos = new FileOutputStream("samle.dat");
			DataOutputStream dos = new DataOutputStream(fos)) {
			
			for(int i : score)
				dos.writeInt(i);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
