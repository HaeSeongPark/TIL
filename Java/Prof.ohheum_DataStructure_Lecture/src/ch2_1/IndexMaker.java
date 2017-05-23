package ch2_1;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

public class IndexMaker
{
//	static String[] words = new String[100_000];
//	static int[] count = new int[100_000];
	static Item[] items = new Item[100_000];
	
//	static
//	{
//		for(int i=0; i<items.length; i++)
//			items[i] = new Item();
//	}
	static int idx = 0;
	static String prompt = "$ ";
	
	public static void main(String [] args)
	{	
		Scanner s = new Scanner(System.in);

		while(true)
		{
			System.out.print(prompt);
			String command = s.next();
			if(command.equalsIgnoreCase("read"))
			{
				String fileName = s.next();
				makeIndex(fileName);
			}
			else if(command.equalsIgnoreCase("find"))
			{
				String word = s.next();
				int index = findWord(word);
				if(index > -1)
					System.out.println("The word \"" + word + "\" appears " + items[index].count + " times.");
				else
					System.out.println("The word \"" + word + "\" doesn't appears ");
			}
			else if(command.equalsIgnoreCase("saveas"))
			{
				String fileName = s.next();
				saveasFile(fileName);
			}
			else if(command.equalsIgnoreCase("exit"))
				break;
			else 					
				System.out.println("유효하지 않은 명령어입니다. 다시 입력해주세요.");
		}
	}
	public static void makeIndex(String fileName)
	{
		try(Scanner s = new Scanner(new File(fileName)))
		{
			while(s.hasNext())
			{
				addWord(s.next());
			}
		}
		catch ( FileNotFoundException e )
		{
			System.out.println("파일을 찾지 못했습니다.");
		}
	}
	
	public static void addWord(String word)
	{
		int index = findWord(word);
		if(index > -1)
		{
//			count[index]++;
			items[index].count++;
		}
		else
		{
			int i=idx-1;
			while(i>=0 && items[i].word.compareTo(word)>0)
			{
				items[i+1] = items[i];
				i--;
			}
			items[i+1] = new Item();
			items[i+1].word = word;
			items[i+1].count = 1;
			idx++;
		}
	}
	
	public static int findWord(String word)
	{
		for(int i=0; i<idx; i++)
		{
			if(word.equals(items[i].word))
			{
				return i;
			}
		}
		return -1;
	}
	public static void saveasFile(String fileName)
	{
		try(PrintWriter out = new PrintWriter(new FileWriter(fileName)))
		{
			for(int i=0; i<idx; i++)
			{
				out.println(items[i].word + " " + items[i].count);
			}
		}
		catch ( IOException e )
		{
			System.out.println("저장 실패");
		}
	}
	
}
