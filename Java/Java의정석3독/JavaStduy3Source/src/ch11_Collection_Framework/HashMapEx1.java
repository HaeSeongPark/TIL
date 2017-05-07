package ch11_Collection_Framework;

import java.util.HashMap;
import java.util.Scanner;

public class HashMapEx1
{
	public static void main(String [] args)
	{
		HashMap<String , String> map = new HashMap<String , String>();
		map.put("myId" , "1234");
		map.put("asdf" , "1111");
		map.put("asdf" , "1234");

		Scanner s = new Scanner(System.in);

		while ( true )
		{
			System.out.println("id와 password를 입력");
			System.out.print("id : ");
			String id = s.nextLine().trim();

			System.out.print("password : ");
			String password = s.nextLine().trim();
			System.out.println();
			if ( !map.containsKey(id) )
			{
				System.out.println("입력하신 id는 존재하지 않습니다.");
				continue;
			}
			else
			{
				if ( !(map.get(id)).equals(password) )
				{
					System.out.println("비밀번호가 일치하지 않습니다. 다시 입력");
				}
				else
				{
					System.out.println("id와 비밀번호가 일치");
					break;
				}
			}
		}
	}
}
