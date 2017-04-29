package ch15_IO;

import java.io.*;
import java.util.*;

public class SerialEx2 {
	public static void main(String[] args) {
		try {
			String name = "UserInfo2.ser";
			FileInputStream fis = new FileInputStream(name);
			BufferedInputStream bis = new BufferedInputStream(fis);
			ObjectInputStream in = new ObjectInputStream(bis);
			
			UserInfo2 u1 = (UserInfo2)in.readObject();
			UserInfo2 u2 = (UserInfo2)in.readObject();
			ArrayList list = (ArrayList)in.readObject();
			
			System.out.println(u1);
			System.out.println(u2);
			System.out.println(list);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
