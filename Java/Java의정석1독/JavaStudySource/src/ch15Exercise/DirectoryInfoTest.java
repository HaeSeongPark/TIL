package ch15Exercise;

import java.io.*;

public class DirectoryInfoTest {
	static int totalFiles = 0;
	static int totalDirs = 0;
	static int totalSize = 0;
	
	public static void main(String[] args) {
		if(args.length != 1){
			System.out.println("USAGE : java DirectoryInfoTest DiRECTORY");
			System.exit(0);
		}
		File dir = new File(args[0]);
		
		if(!dir.exists() || !dir.isDirectory()){
			System.out.println("유호하지 않은 디렉토리입니다.");
			System.exit(0);
		}
		
		countFiles(dir);
		
		System.out.println();
		System.out.println("총 " + totalFiles + "개의 파일");
		System.out.println("총 " + totalDirs + "개의 디렉토리");
		System.out.println("크기 " + totalSize + "bytes");
	}
	public static void countFiles(File dir){
//		1. dir의 파일목록(File [])을 얻어온다.
		File[] files = dir.listFiles();
//		2. 얻어온 파일목록의 파일중에서
		for(int i=0; i<files.length; i++){
			// 디렉토리이면 totalDirs의 값을 증가시키고 countFiles()를 재귀호출
			if(files[i].isDirectory()){
				totalDirs++;
				countFiles(files[i]);
			}
			//파일이면 totallFiles를 증가시키고 파일의 크기를 totalSize에 더한다.
			if(files[i].isFile()){
				totalFiles++;
				totalSize+=files[i].length();
			}
	
		}
		
	}
}
