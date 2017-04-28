package ch15_IO;

import java.io.*;

public class DataOutputStreameEx1 {
	public static void main(String[] args) {

		
		try (  FileOutputStream	fos = new FileOutputStream("sample.dat");
				DataOutputStream dos = new DataOutputStream(fos)){

			dos.writeInt(10);
			dos.writeFloat(20.0f);
			dos.writeBoolean(true);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
