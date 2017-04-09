package ch8_Exception;

import java.io.*;

public class Exception16 {
	public static void main(String[] args) {

		try {
			File f = createFile("test");
			System.out.println(f.getName() + " 파일이 성공적으로 생성 됨");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	static File createFile(String fileName) throws Exception{
		if(fileName == null || fileName.equals(""))
			throw new Exception("파일이름이 유효하지 않습니다.");
		
		File f = new File(fileName);
		f.createNewFile();
		return f;
	}
}
