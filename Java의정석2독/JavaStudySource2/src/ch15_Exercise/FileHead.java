package ch15_Exercise;

import java.io.*;

public class FileHead {
	public static void main(String[] args) throws Exception{
		if(args.length!=2){
			System.out.println("USAGE: java FileHead 10 FILENAME");
			System.exit(0);
		}
		
		File file = new File(args[1]);
		int lineNum = Integer.parseInt(args[0]);
		
		if(file.isDirectory() || !file.exists()){
			System.out.println(file.getName() + "은/는" + "디렉토리이거나, 존재하지 않는 파일입니다.");
			System.exit(0);
		}
		
		FileReader fr = new FileReader(file);
		BufferedReader br = new BufferedReader(fr);
		
		for(int i=0; i<lineNum; i++){
			System.out.println(br.readLine());
		}
		
		br.close();
	}

}
