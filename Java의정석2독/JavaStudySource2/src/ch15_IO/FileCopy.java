package ch15_IO;

import java.io.*;

public class FileCopy 
{
	public static void main(String[] args) 
	{

		try(FileReader fr = new FileReader(args[0]);
			FileWriter fw = new FileWriter(args[1])) 
		{
			int data = 0;
			while((data=fr.read())!=-1)
			{
				fw.write(data);
			}
			
		} 
		catch (Exception e) 
		{
			System.out.println("error");
		}
	}
}
