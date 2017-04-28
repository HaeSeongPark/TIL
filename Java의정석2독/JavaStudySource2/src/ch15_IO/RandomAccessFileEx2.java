package ch15_IO;

import java.io.*;

public class RandomAccessFileEx2 {
	public static void main(String[] args) {
		int[] score = {
				1, 100, 90, 90,
				2, 70, 90, 100,
				3, 100, 100, 100,
				4, 70, 90, 100
		};
		
		try (RandomAccessFile raf = new RandomAccessFile("score2.txt", "rw")){
			for(int i=0; i<score.length; i++)
				raf.writeInt(score[i]);
			raf.seek(0);
			while(true)
				System.out.println(raf.readInt());
		} catch (EOFException eof) {
			// readInt()를 호출했을 때 더 이상 읽을 내용이 없으면 EOFException이 발생
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
