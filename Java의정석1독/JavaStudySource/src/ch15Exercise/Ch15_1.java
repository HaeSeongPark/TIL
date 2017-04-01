package ch15Exercise;

import java.io.*;

public class Ch15_1 {
	public static void main(String[] args) {
		
		try{
			int lineNum = Integer.parseInt(args[0]);
			String fileName = args[1];
			
			File f = new File(fileName);
			
			if(f.exists()&&!f.isDirectory()){
				BufferedReader br = new BufferedReader(new FileReader(fileName));
				String line = "";
				int i=1;
				
				while((line = br.readLine())!=null && i <= lineNum){
					System.out.println(i+":"+line);
					i++;
				}
			}else{
				throw new FileNotFoundException(fileName+"은/는 디렉토리이거나, 존재하지 않는 파일입니다.");
			}
		}catch(FileNotFoundException e){
			
		}
		catch(Exception e){
			
		}
//		if(args.length != 2){
//			System.out.println("USAGE : java FileEx2 DIRECTORY");
//			System.exit(0);
//		}
//		
//		int lineNum = Integer.parseInt(args[0]);
//		String fileName = args[1];
//		
//		File f = new File(fileName);
//		
//		if(!f.exists() || f.isDirectory()){
//			System.out.println(fileName+"은/는 디렉토리이거나, 존재하지 않는 파일입니다.");
//			System.exit(0);
//		}
//		
//		try {
//			FileReader fr = new FileReader(fileName);
//			BufferedReader br = new BufferedReader(fr);
//			
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		}
//		String line;
//		while((line=br.readLine())!null && i <= lineNum){
//			
//		}
	}
}
