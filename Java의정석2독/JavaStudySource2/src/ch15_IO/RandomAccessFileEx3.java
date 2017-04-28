package ch15_IO;

import java.io.*;

public class RandomAccessFileEx3 {
	public static void main(String[] args) {
		int sum = 0;
		
		try(RandomAccessFile raf = new RandomAccessFile("score2.txt", "r")) {
			int i = 4;
			while(true){
				raf.seek(i);
				sum+=raf.readInt();
				i+=16;
			}
		} catch (Exception e) {
			System.out.println("sum : " + sum);
		}
	}
}
