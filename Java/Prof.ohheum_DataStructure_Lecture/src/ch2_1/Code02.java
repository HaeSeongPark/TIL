package ch2_1;

import java.io.File;
import java.util.Scanner;

public class Code02
{
	static Person [] members = new Person [100];
	static int count = 0;

	public static void main(String [] args)
	{
		try ( Scanner s = new Scanner(new File("data2.txt")))
		{
			while ( s.hasNext() )
			{
				String str = s.next();
				String str2 = s.next();
				members[count] = new Person();
				members[count].name = str;
				members[count].number = str2;
				count++;
			}

		}
		catch ( Exception e )
		{
			System.out.println("no data file exists.");
			e.printStackTrace();
		}

		for ( int i = 0; i < count; i++ )
		{
			System.out.println(members[i].name + "'s phone number is " + members[i].number);
		}
	}
}
