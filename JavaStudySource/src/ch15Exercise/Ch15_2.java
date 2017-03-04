package ch15Exercise;

import java.io.*;

public class Ch15_2 {
	public static void main(String[] args) {
		try {
			FileInputStream fis = new FileInputStream(args[0]);
			int data = 0;
			int i=0;
			while((data=fis.read()) != -1){
				System.out.printf("%x ",data);
				if(++i%16==0)
					System.out.println();
			fis.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
