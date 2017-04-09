package ch8_Exception;

import java.io.*;

public class Exception15 {
	public static void main(String[] args) {
		File f;
		try {
			f = createFile(args[0]);
		} catch (Exception e) {
			f = createFile("test");
		}
		System.out.println(f.getName() + " 파일이 성공적으로 생성됐습니다.");
		
	}
	
	@SuppressWarnings("finally")
	static File createFile(String fileName){
		try {
			if( fileName == null || fileName.equals(""))
				throw new Exception(" 파일 이름이 유효하지 않습니다.");
		} catch (Exception e) {
			fileName = "제목없음";
		} finally{
			File f = new File(fileName);
			createNewFile(f);
			return f;
		}
	}
	
	static void createNewFile(File f){
		try {
			f.createNewFile();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
