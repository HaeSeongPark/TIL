package ch11;

import java.io.*;
import java.util.*;

public class PropertiedEx2 {

	public static void main(String[] args) {
		if(args.length != 1){
			System.out.println("USAGE:java PropertiesEx2 INPUTFILENAME");
			System.exit(0);
		}
		Properties prop = new Properties();
		
		String inputFile = args[0];
		
		try {
			prop.load(new FileInputStream(inputFile));
		} catch (IOException e) {
			System.out.println("지정된 파일을 찾을 수 없습니다.");
			System.exit(0);
		}
		String name = prop.getProperty("name");
		String[] data = prop.getProperty("data").split(",");
		
		int max =0, min=0, sum=0;
		for(int i=0; i<data.length; i++){
			int intValue = Integer.parseInt(data[i]);
			if (i==0) max =min = intValue;
			
			if(max < intValue)
				max = intValue;
			else if(min > intValue)
				min = intValue;
			
			sum += intValue;
		}
		System.out.println("이름:"+name);
		System.out.println("최대값:"+max);
		System.out.println("최소값:"+min);
		System.out.println("합계:"+sum);
		System.out.println("평균"+(sum*100.0/data.length)/100);
	}

}
