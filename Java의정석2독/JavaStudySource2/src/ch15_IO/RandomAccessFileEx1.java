package ch15_IO;

import java.io.RandomAccessFile;

public class RandomAccessFileEx1 {
	public static void main(String[] args) {
		try {
			RandomAccessFile raf = new RandomAccessFile("test.dat","rw");
			System.out.println(" 파일 포인터 위차 : " + raf.getFilePointer());
			raf.writeInt(100);
			System.out.println(" 파일 포인터 위차 : " + raf.getFilePointer());
			raf.writeLong(100L);
			System.out.println(" 파일 포인터 위차 : " + raf.getFilePointer());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
