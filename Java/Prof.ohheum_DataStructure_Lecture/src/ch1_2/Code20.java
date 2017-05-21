package ch1_2;

import java.io.File;

/*
 *  * 파일데이터가져와서
 *   알파벳순으로 정렬
 */
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Code20
{
	static int count = 0;
	static String[] name = new String[100];
	static String[] number = new String[100];
	
	public static void main(String [] args)
	{
		try(Scanner inFile = new Scanner(new File("sample.txt")))
		{
			while(inFile.hasNext())
			{
				name[count] = inFile.next();
				number[count] = inFile.next();
				count++;
			}
		}
		catch ( FileNotFoundException e )
		{
			System.out.println("no File");
			return;
		}
		
		
		bubbleSort();
		
		for(int i=0; i<count; i++)
			System.out.println("Name : " + name[i] + ", number : " + number[i]);
	}
	static void bubbleSort()
	{
		for(int i=count-1; i>0; i--)
		{
			for(int j=0; j<i; j++)
			{
				// str.compareTo(str2) 했을 때 str>str2이면 >0
				if(name[j].compareToIgnoreCase(name[j+1]) > 0)
				{
					String tmpName = name[j];
					name[j] = name[j+1];
					name[j+1] = tmpName;
					
					String tmpNum = number[j];
					number[j] = number[j+1];
					number[j+1] = tmpNum;
					
				}
			}
		}
	}
}
