package ch15Exercise;

import java.io.*;
import java.util.*;
import java.util.regex.*;

public class Ch15_6 {
	static String[] argArr;  // 입력한 매개변수를 담기위한 문자열배열
	static File curDir;      // 현재 디렉토리
	
	static{
		try{
			curDir = new File(System.getProperty("userdir"));
		}catch(Exception e){}
	}
	
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		while(true){
			try {
				String prompt = curDir.getCanonicalPath() + ">>";
				System.out.print(prompt);
				
				//화면으로부터 라인단위로 입력받는다.
				String input = s.nextLine();
				
				input = input.trim(); // 입력받은 값에서 불필요한 앞뒤 공백을 제거한다.
				argArr = input.split(" +");
				
				String command = argArr[0].trim();
				
				if("".equals(command)) continue;
				
				command = command.toLowerCase(); // 명령어를 소문자로 바꾼다.
				
				if(command.equals("q")){
					System.exit(0);
				}else if(command.equals("cd")){
					cd();
				}else{
					for(int i=0; i < argArr.length; i++){
						System.out.println(argArr[i]);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("입력오류입니다.");
			}
		}
	}
	public static void cd(){
		if(argArr.length==1){
			System.out.println(curDir);
			return;
		}else if(argArr.length > 2){
			System.out.println("USAGE : cd directory");
			return;
		}
		String subDir = argArr[1];
		
		// 입력된 디렉토리(subDir)가 ".."이면, 현재 디렉토리의 조상 디렉토리를 얻어서 현재 디렉토리 지정
		if(subDir.equals("..")){
			File newDir = curDir.getParentFile();
			
			if(newDir==null){
				System.out.println("유효하지 않은 디렉토리입니다.");
			}else{
				curDir = newDir;
			}
		// 입력된 디렉토리가 "."이면, 단순히 현재 디렉토리의 경로를 화면에 출력한다.
		}else if(subDir.equals(".")){
			System.out.println(curDir);
		}else{  // 1,2가 아니면
			// 입력된 디렉토리(subDir)가 현 재 디렉토리의 하위디렉톡리인지 확인한다.
			File newDir = new File(curDir, subDir);
			// 확인결과 true이면 현재 디렉토리(curDir)를 입력된 디렉토리(subDir)로 변경
			if(newDir.exists() && newDir.isDirectory())
				curDir = newDir;
			else
				System.out.println("유효하지 않은 디렉토리");
		}
		
	}
}
