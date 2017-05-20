package ch1_2;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

/*
 * 파일데이터가져오기
 */

public class Code19
{
	public static void main(String [] args)
	{
		int count = 0;
		String[] name = new String[100];
		String[] number = new String[100];
		
		
		try(Scanner inFile = new Scanner(new File("sample.txt"));)
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
		
		for(int i=0; i<count; i++)
			System.out.println("Name : " + name[i] + ", number : " + number[i]);
		
	}
}
