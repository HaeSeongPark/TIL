package ch15_Exercise;

import java.io.*;

public class FileHeadAnswer {
	public static void main(String[] args) {
		try {
			int lineNum = Integer.parseInt(args[0]);
			String fileName = args[1];
			File f = new File(fileName);
			
			if(f.exists() && !f.isDirectory()){
				BufferedReader br = new BufferedReader(new FileReader(f));
				String line = "";
				int i =1;
				while((line=br.readLine())!=null && i<=lineNum){
					System.out.println(i+":"+line);
					i++;
				}
			} else{
				throw new FileNotFoundException(fileName + "은/는 디렉토리이거나, 존재하지 않는 파일입니다.");
			}
		} catch(FileNotFoundException e){
			System.out.println(e.getMessage());
		} catch (Exception e) {
			System.out.println("USAGE:java  FileHead 10 FILENAME");
		}
	}
}
