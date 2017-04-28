package ch15_IO;

import java.io.DataInputStream;
import java.io.FileInputStream;

public class DataInputStreamEx1 {
	public static void main(String[] args) {
		String file = "D:\\newGit\\Java의정석2독\\JavaStudySource2\\sample.dat";
		try(FileInputStream fis = new FileInputStream(file);
				DataInputStream dis = new DataInputStream(fis)) {
			
			System.out.println(dis.readInt());
			System.out.println(dis.readFloat());
			System.out.println(dis.readBoolean());
		} catch (Exception e) {
		}
	}
}
