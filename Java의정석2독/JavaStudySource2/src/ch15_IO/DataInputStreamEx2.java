package ch15_IO;

import java.io.*;

public class DataInputStreamEx2 {
	public static void main(String[] args) {
		int sum = 0;
		int score = 0;
		
		try(FileInputStream fis = new FileInputStream("samle.dat");
				DataInputStream dis = new DataInputStream(fis)) {
			
			while(true){
				score = dis.readInt();
				sum+= score;
				System.out.println(score);
			}
			
		} catch (EOFException e) {
			System.out.println("점수의 총합은 " + sum + "입니다.");
		} catch (IOException e){
			e.printStackTrace();
		}
	}
}
