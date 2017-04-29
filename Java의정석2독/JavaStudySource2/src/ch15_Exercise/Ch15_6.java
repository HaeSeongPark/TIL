package ch15_Exercise;

import java.io.*;
import java.util.*;
import java.util.regex.*;

public class Ch15_6 {
	static String[] argArr;
	static File curDir;
	
	static {
		try {
			curDir = new File(System.getProperty("user.dir"));
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		while(true){
			try {
				String prompt = curDir.getCanonicalPath() + ">>";
				System.out.print(prompt);
				
				String input = s.nextLine().trim();
				
				argArr = input.split(" +");
				
				String command = argArr[0].trim();
				
				if("".equals(command)) continue;
				
				if(command.equalsIgnoreCase("q")){
					System.exit(0);
				} else if ( command.equalsIgnoreCase("cd")){
					cd();
				} else {
					for(int i=0; i<argArr.length; i++){
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
		} else if(argArr.length>2){
			System.out.println("USAGE : cd directory");
			return;
		}
		String subDir = argArr[1];
		if(subDir.equals("..")){
			curDir = curDir.getParentFile();
		} else if (subDir.equals(".")){
			System.out.println(curDir);
		} else {
			File newDir = new File(curDir,subDir);
			if(newDir.exists() && newDir.isDirectory()){
				curDir = newDir;
			} else {
				System.out.println("유효하지 않은 디렉토릭입니다.");
			}
		}
	}
}
