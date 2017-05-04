package ch11_Collection_Framework;

import java.io.FileInputStream;
import java.util.*;

public class PropertiesEx2
{
	public static void main(String [] args)
	{
		Properties prop = new Properties();
		
		String file = "src\\ch11_Collection_Framework\\input.txt";
		try
		{
			prop.load(new FileInputStream(file));
		}
		catch ( Exception e )
		{
			System.out.println("지정된 파일을 찾을 수 없습니다.");
			System.exit(0);
		}
		
		String name = prop.getProperty("name");
		try
		{
			name = new String(name.getBytes("8859_1"), "EUC-KR");
		}
		catch ( Exception e )
		{

		}
		
		String[] data = prop.getProperty("data").split(",");
		
		int max = 0, min = 0, sum = 0;
		for(int i=0; i<data.length; i++)
		{
			int intValue = Integer.parseInt(data[i]);
			if(i==0) max = min = intValue;
			
			if(max < intValue)
				max = intValue;
			else if ( min > intValue)
				min = intValue;
			
			sum+=intValue;
		}
		System.out.println("이름:"+name);
		System.out.println("최대값:"+max);
		System.out.println("최소값:"+min);
		System.out.println("합계:"+sum);
		System.out.println("평균" + (sum/data.length*100.0)/100);
	}
}
